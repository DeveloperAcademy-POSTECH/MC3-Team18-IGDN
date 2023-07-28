//
//  GameManager.swift
//  SpriteKitTest
//
//  Created by changgyo seo on 2023/07/09.
//

import SpriteKit
import Combine

class GameManager: ObservableObject {
    
    // MARK: CancellableBag
    var bag = Set<AnyCancellable>()
    
    var scene: SKScene?
    // MARK: Input
    @Published var touchesBegin: (Set<UITouch>, SKScene)
    @Published var touchesEnd: (Set<UITouch>, SKScene)
    @Published var contact: SKPhysicsContact
    
    // MARK: Output
    
    // MARK: Nodes
    var nodes: Nodes
    var backGround: BackGround
    var map: [ObstacleProtocol]
    
    // MARK: Node-Action Dictionary
    var nodeActionDictionary: [String : SKAction] = [:]
    
    // MARK: Timer
    let gameTimer = GameTimer(timeInterval: 0.02)
    let backgroundTimer = GameTimer(timeInterval: 1.0)
    
    // MARK: Delegate
    var delegate: ShowAlertDelegate? = nil
    
    // MARK: private
    @Published var throatGauge: Int = 100
    
    private var gameConstants: GameConstants
    
    // MARK: Temp
    var ObstacleIndex = 0
    var plentTime = 0
    private var isNodeMove = false
    
    init(constants: GameConstants, map: [ObstacleProtocol]) {
        self.touchesBegin = ([], SKScene())
        self.touchesEnd = ([], SKScene())
        self.contact = SKPhysicsContact()
        self.nodes = Nodes()
        self.backGround = BackGround(constants: constants)
        self.gameConstants = constants
        self.map = map
        
        self.map.sort { $0.point.x < $1.point.x }
        
        binding()
    }
    
    func restartGame(scene: SKScene) {
        settingGame(scene: scene)
    }
    
    func settingGame(scene: SKScene) {
        scene.isUserInteractionEnabled = false
        self.scene = scene
        
        scene.addChilds(nodes.all)
        //nodes.settingPlanets()
        nodes.positioning(size: scene.size)
        nodes.setEachPhisicalBody()
        nodes.setName()
        nodes.imageSetting()
        
        nodes.leftThroat.delegate = self
        
    }
    
    func startGame() {
        gameTimer.startTimer(completion: gameTimerAction)
        backgroundTimer.startTimer(completion: backgroundTimerAction)
    }
    
    func gameTimerAction(_ x: Double) {
        
        if ObstacleIndex >= map.count {
            //            gameTimer.stopTimer()
            //            scene?.isPaused = true
            //            delegate?.showAlert(alertType: .success)
        }
        else {
            while ObstacleIndex < map.count && Double(plentTime) > map[ObstacleIndex].point.x {
                let currentData = map[ObstacleIndex]
                let planet = currentData.makePlanetNode()
                planet.delegate = self
                scene?.addChild(planet)
                planet.startDirectionNodesRotation()
                planet.runAndRemove(SKAction.moveTo(x: -150, duration: gameConstants.planetDuration))
                
                ObstacleIndex += 1
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [self] in
                    let percent = CGFloat(self.ObstacleIndex) / CGFloat(self.map.count)
                    self.nodes.topProgressBar.percent = percent
                    self.nodes.bottomProgressBar.percent = percent
                }
                if !isNodeMove {
                    isNodeMove = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        self.scene?.isUserInteractionEnabled = true
                        self.nodes.astronaut.startGame()
                    }
                }
            }
        }
        plentTime += 1
    }
    
    func backgroundTimerAction(_ x: Double) {
        let index = Int(x) % 30
        
        let backgroundNodes = backGround.timeLayer[index]

        scene?.addChilds(backgroundNodes.map { $0 })
        for node in backgroundNodes {
            node.runAndRemove(SKAction.sequence([SKAction.fadeIn(withDuration: 1), SKAction.fadeOut(withDuration: 1)]).forever)
            node.runAndRemove(SKAction.moveTo(x: -100, duration: node.duration), withKey: "moveBackground")
        }
        
    }
    
    func binding() {
        
        $touchesBegin
            .sink { [weak self] (touches, scene) in
                
                guard let self = self else { return }
                scene.isPaused = false
                for touch in touches {
                    let location = touch.location(in: scene)
                    
                    if self.nodes.rightButton.contains(location) {
                        if throatGauge > 0 && nodes.astronaut.status != .inOribt {
                            
                            nodes.astronaut.startTurnCounterClockwise()
                            nodes.leftThroat.useThroat()
                            nodes.rightThroat.useThroat()
                        }
                    }
                    else if self.nodes.leftButton.contains(location){
                        if throatGauge > 0  && nodes.astronaut.status != .inOribt {
                           
                            nodes.astronaut.startTurnClockwise()
                            nodes.leftThroat.useThroat()
                            nodes.rightThroat.useThroat()
                        }
                    }
                    
                    if self.nodes.changeColorOne.contains(location) {
                        let newColor = nodes.astronaut.type.combine(.one)
                        typeForChangeColor(newColor)
                        if nodes.astronaut.status == .inOribt {
                            guard let newAstronuat = nodes.astronaut.orbitPlanet?.changedColor(to: newColor) else { return }
                            nodes.astronaut = newAstronuat
                            nodes.setAstronuat()
                            scene.addChild(nodes.astronaut)
                            nodes.leftThroat.stopUse()
                            nodes.rightThroat.stopUse()
                            nodes.astronaut.startFoward()
                        }
                    }
                    if self.nodes.changeColorTwo.contains(location) {
                        let newColor = nodes.astronaut.type.combine(.two)
                        typeForChangeColor(newColor)
                        if nodes.astronaut.status == .inOribt {
                            guard let newAstronuat = nodes.astronaut.orbitPlanet?.changedColor(to: newColor) else { return }
                            nodes.astronaut = newAstronuat
                            nodes.setAstronuat()
                            nodes.leftThroat.stopUse()
                            nodes.rightThroat.stopUse()
                            scene.addChild(nodes.astronaut)
                            
                            nodes.astronaut.startFoward()
                        }
                    }
                    if self.nodes.pauseButton.contains(location) {
                        
                        scene.isPaused = true
                        gameTimer.stopTimer()
                        backgroundTimer.stopTimer()
                       // delegate?.showAlert(alertType: .tutorial(activate: [.changeGreen, .turnClockWise],
                                //                                 bottomString: "FUCK YOU GUYs", topString: "fuck the shit"))
                        delegate?.showAlert(alertType: .pause)
                    }
                }
            }
            .store(in: &bag)
        
        $touchesEnd
            .sink {  [weak self] (touches, scene) in
                
                guard let self = self else { return }
                
                for touch in touches {
                    let location = touch.location(in: scene)
                    
                    if self.nodes.rightButton.contains(location) {
                        nodes.leftThroat.stopUse()
                        nodes.rightThroat.stopUse()
                        nodes.astronaut.endTurnCounterClockwise()
                    }
                    else if self.nodes.leftButton.contains(location){
                        nodes.leftThroat.stopUse()
                        nodes.rightThroat.stopUse()
                        nodes.astronaut.endTurnClockwise()
                    }
                }
            }
            .store(in: &bag)
        
        $contact
            .sink { [weak self] contact in
                guard let self = self else { return }
                
                let nodeA = contact.bodyA.node
                let nodeB = contact.bodyB.node
                
                // 충돌 처리 로직을 추가합니다.
                if (nodeA?.name == "astronaut" && nodeB?.name == "wall") || (nodeA?.name == "wall" && nodeB?.name == "astronaut") {
                    self.scene?.isPaused = true
                    delegate?.showAlert(alertType: .fail)
                }
                else if (nodeA?.name == "astronaut" && nodeB?.name == "planet") || (nodeA?.name == "planet" && nodeB?.name == "astronaut") {
                    if nodeA?.name == "planet", let astronaut = nodeB as? AstronautNode, let planet = nodeA as? PlanetNode {
                        if planet.astronautColor == astronaut.type {
                            
                            astronaut.orbitPlanet = planet
                            astronaut.status = .inOribt
                            nodes.leftThroat.fillThroat()
                            nodes.rightThroat.fillThroat()
                            planet.startRotation(at: contact.contactPoint, thatNodePoint: astronaut)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                astronaut.removeFromParent()
                            }
                        }
                        else if planet.id != astronaut.id {
                            self.scene?.isPaused = true
                            delegate?.showAlert(alertType: .fail)
                        }
                    }
                    else if let astronaut = nodeA as? AstronautNode, let planet = nodeB as? PlanetNode {
                        if planet.astronautColor == astronaut.type {
                            astronaut.orbitPlanet = planet
                            astronaut.status = .inOribt
                            nodes.leftThroat.fillThroat()
                            nodes.rightThroat.fillThroat()
                            planet.startRotation(at: contact.contactPoint, thatNodePoint: astronaut)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                astronaut.removeFromParent()
                            }
                        }
                        else if planet.id != astronaut.id {
                            self.scene?.isPaused = true
                            delegate?.showAlert(alertType: .fail)
                        }
                    }
                    
                }
            }
            .store(in: &bag)
        
        $throatGauge
            .sink { gague in
                if gague <= 0 {
                    self.nodes.leftThroat.stopUse()
                    self.nodes.rightThroat.stopUse()
                    self.nodes.astronaut.removeAllActions()
                    self.nodes.astronaut.startFoward()
                }
            }
            .store(in: &bag)
    }
    
    func typeForChangeColor(_ newType: AstronautColor) {
        let redButton = SKTexture(imageNamed: "RedButton")
        let greenButton = SKTexture(imageNamed: "GreenButton")
        let redButtonDisable = SKTexture(imageNamed: "RedButtonDisable")
        let greenButtonDisable = SKTexture(imageNamed: "GreenButtonDisable")
        switch newType {
        case .one:
            nodes.changeColorOne.texture = greenButtonDisable
            nodes.changeColorTwo.texture = redButton
        case .two:
            nodes.changeColorOne.texture = greenButton
            nodes.changeColorTwo.texture = redButtonDisable
        case .none:
            nodes.changeColorOne.texture = greenButton
            nodes.changeColorTwo.texture = redButton
        case .combine:
            nodes.changeColorOne.texture = greenButtonDisable
            nodes.changeColorTwo.texture = redButtonDisable
        }
    }
}

extension GameManager {
    
    func generateScene(size: CGSize) ->  GameScene {
        GameScene(gameManager: self, size: size)
    }
    
    class Nodes {
        
        let background = SKSpriteNode()
        var astronaut = AstronautNode(color: .white, size: CGSize(width: 30, height: 30))
        let leftButton = SKSpriteNode(color: .white, size: CGSize(width: 85, height: 85))
        let leftThroat = ThroatProgressNode()
        let topProgressBar = ProgressBarNode()
        let bottomProgressBar = ProgressBarNode()
        let rightButton = SKSpriteNode(color: .white, size: CGSize(width: 85, height: 85))
        let rightThroat = ThroatProgressNode()
        let changeColorOne = SKSpriteNode(color: AstronautColor.one.color, size: CGSize(width: 85, height: 85))
        let changeColorTwo = SKSpriteNode(color: AstronautColor.two.color, size: CGSize(width: 85, height: 85))
        let leftWall = SKSpriteNode()
        let rightWall = SKSpriteNode()
        let topWall = SKSpriteNode()
        let bottomWall = SKSpriteNode()
       // var planets: [TempPlanetNode] = []
        var pauseButton = SKSpriteNode(color: .white, size: CGSize(width: 37, height: 144))
        
        var all: [SKNode] {
            [background, bottomProgressBar, topProgressBar, leftThroat, rightThroat, astronaut, leftButton, rightButton, leftWall, rightWall, topWall, bottomWall, changeColorOne, changeColorTwo, pauseButton]
        }
        
        func imageSetting() {
            
            let texture2 = SKTexture(imageNamed: "CounterClockWiseButton")
            rightButton.texture = texture2
            rightButton.zRotation = CGFloat.pi
            
            let texture1 = SKTexture(imageNamed: "ClockWiseButton")
            leftButton.texture = texture1
            
            let pauseButtonTexture = SKTexture(imageNamed: "buttonPause")
            pauseButton.texture = pauseButtonTexture
            
            let redButtonTexture = SKTexture(imageNamed: "RedButton")
            changeColorTwo.texture = redButtonTexture
            changeColorTwo.zRotation = CGFloat.pi
            
            let blueButtonTexture = SKTexture(imageNamed: "GreenButton")
            changeColorOne.texture = blueButtonTexture
            
            let astronautTexture = SKTexture(imageNamed: AstronautColor.none.imageName)
            astronaut.texture = astronautTexture
        }
        
//        func settingPlanets() {
//
//            var index = 0
//            let circlePath = TempPlanetNode.createCirclePath(center: .zero, radius: 50)
//            let squarePath = TempPlanetNode.createSquarePath()
//
//            for _ in 0 ..< 10 {
//
//                var path = CGPath(rect: .zero, transform: nil)
//
//                if index % 2 == 0 {
//                    path = squarePath
//                }
//                else if index % 2 == 1 {
//                    path = circlePath
//                }
//
//                let planet = TempPlanetNode()
//                planet.path = path //TempPlanetNode(path: path)
//                planet.physicsBody = SKPhysicsBody(polygonFrom: path)
//
//                planet.fillColor = planet.color.color
//                planet.positionFromLeftBottom(400, CGFloat(Int.random(in: 170 ... (674 - Int(planet.frame.height)))))
//
//                planet.strokeColor = .clear
//
//                planet.name = "planet"
//
//                planet.physicsBody?.categoryBitMask = 4
//
//                planet.physicsBody?.contactTestBitMask = 1
//                planet.physicsBody?.collisionBitMask = 0
//                planets.append(planet)
//
//                index += 1
//            }
//        }
        
        func makeGradient(_ color1: UIColor, _ color2: UIColor) -> CAGradientLayer {
            let gradient = CAGradientLayer()
            gradient.colors = [color1, color2]
            gradient.locations = [0.0, 1.0]
            gradient.startPoint = CGPoint(x: 5.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 5.0, y: 1.0)
            
            return gradient
        }
        
        
        func positioning(size: CGSize) {
            
            let bgTexture = SKTexture(imageNamed: "BackGround")
            background.texture = bgTexture
            background.position = CGPoint(x: size.width / 2, y: size.height / 2)
            background.size = size
            background.zPosition = -100
            
            astronaut.position = CGPoint(x: 70, y: size.height / 2)
            astronaut.zPosition = 1
            
            pauseButton.positionFromLeftMiddle(0, size.height / 2)
            pauseButton.zPosition = 2
            
            leftButton.positionFromLeftBottom(46, 69.5)
            leftThroat.position = leftButton.position
            bottomProgressBar.position = CGPoint(x: 320, y: 192.5)
            
            changeColorOne.positionFromLeftBottom(259, 69.5)
            changeColorOne.zPosition = 2
            leftButton.zPosition = 2
            leftThroat.zPosition = 2
            
            changeColorTwo.positionFromLeftBottom(46, 689.5)
            rightButton.positionFromLeftBottom(259, 689.5)
            topProgressBar.position = CGPoint(x: 320, y: 651.5)
            topProgressBar.zRotation = CGFloat.pi
            rightThroat.position = rightButton.position
            rightThroat.zRotation = CGFloat.pi
            rightThroat.zPosition = 2
            rightButton.zPosition = 2
            changeColorTwo.zPosition = 2
            
            leftWall.size = CGSize(width: 1, height: size.height * 2)
            rightWall.size = CGSize(width: 1, height: size.height * 2)
            topWall.size = CGSize(width: size.width, height: 116)
            let texture = SKTexture(imageNamed: "ButtonArea")
            bottomWall.texture = texture
            topWall.texture = texture
            topWall.zRotation = CGFloat.pi
            bottomWall.size = CGSize(width: size.width, height: 116)
            
            leftWall.position = CGPoint(x: 0, y: 0)
            rightWall.position = CGPoint(x: size.width - 1 , y: 0)
            topWall.positionFromLeftBottom(0, size.height - 170)
            bottomWall.positionFromLeftBottom(0, 54)
        }
        
        func setName() {
            astronaut.name = "astronaut"
            leftWall.name = "wall"
            rightWall.name = "wall"
            topWall.name = "wall"
            bottomWall.name = "wall"
        }
        
        func removeAll() {
            [astronaut, leftButton, rightButton, leftWall, rightWall, topWall, bottomWall, changeColorOne, changeColorTwo, pauseButton]
                .forEach { node in
                    node.removeAllActions()
                    node.removeAllChildren()
                }
//            planets.forEach { node in
//                node.removeAllActions()
//                node.removeAllChildren()
//
//            }
        }
        
        func setAstronuat() {
            astronaut.name = "astronaut"
            astronaut.physicsBody = SKPhysicsBody(rectangleOf: astronaut.frame.size)
            astronaut.physicsBody?.categoryBitMask = 1
            astronaut.physicsBody?.contactTestBitMask = 4 | 2
            astronaut.physicsBody?.collisionBitMask = 2
        }
        
        func setEachPhisicalBody() {
            for node in [leftWall, rightWall, topWall, bottomWall, astronaut] {
                node.physicsBody = SKPhysicsBody(rectangleOf: node.frame.size)
            }
            
            leftWall.physicsBody?.categoryBitMask = 2
            rightWall.physicsBody?.categoryBitMask = 2
            topWall.physicsBody?.categoryBitMask = 2
            bottomWall.physicsBody?.categoryBitMask = 2
            
            astronaut.physicsBody?.categoryBitMask = 1
            
            astronaut.physicsBody?.contactTestBitMask = 4 | 2
            
            leftWall.physicsBody?.contactTestBitMask = 1
            leftWall.physicsBody?.collisionBitMask = 1
            
            rightWall.physicsBody?.contactTestBitMask = 1
            rightWall.physicsBody?.collisionBitMask = 1
            
            topWall.physicsBody?.contactTestBitMask = 1
            topWall.physicsBody?.collisionBitMask = 1
            
            bottomWall.physicsBody?.contactTestBitMask = 1
            bottomWall.physicsBody?.collisionBitMask = 1
            
            astronaut.physicsBody?.collisionBitMask = 2
        }
    }
}

extension GameManager {
    
    class BackGround {
        
        class Node: SKSpriteNode {
            
            let id: String = UUID().uuidString
            var time: Int = 0
            var duration: TimeInterval = 0.0
            
            override init(texture: SKTexture? = nil, color: UIColor, size: CGSize) {
                super.init(texture: nil, color: color, size: size)
            }
            
            convenience init(time: Int, duration: TimeInterval) {
                self.init(color: .clear, size: .zero)
                
                self.time = time
                self.duration = duration
            }
            
            required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
        }
        
        var timeLayer: [[Node]] = Array(repeating: [], count: 31)
        
        init(constants: GameConstants) {
            
            for _ in 0 ... 20 {
                let time = Int.random(in: 0 ... 30)
                let node = Node(
                    time: time,
                    duration: constants.backgroundFirstLayerDuration )
                
                let sizeNTexture = makeLayer1Random()
                node.texture = sizeNTexture.0
                node.size = sizeNTexture.1
                node.zPosition = -1
                
                node.positionFromLeftBottom(400, CGFloat(Int.random(in: 170 ... (674 - Int(node.size.height)))))
                timeLayer[time].append(node)
            }
            
            for _ in 0 ... 100 {
                let time = Int.random(in: 0 ... 30)
                let node = Node(time: time,
                                duration: constants.backgroundSecondLayerDuration)
                
                node.zPosition = -1
                let sizeNTexture = makeLayer2Random()
                node.texture = sizeNTexture.0
                node.size = sizeNTexture.1
                node.positionFromLeftBottom(400, CGFloat(Int.random(in: 170 ... (674 - Int(node.size.height)))))
                timeLayer[time].append(node)
            }
            
            for _ in 0 ... 200 {
                let time = Int.random(in: 0 ... 30)
                let node = Node(time: time,
                                duration: constants.backgroundThirdLayerDuration)
                
                node.zPosition = -1
                let sizeNTexture = makeLayer3Random()
                node.texture = sizeNTexture.0
                node.size = sizeNTexture.1
                
                node.positionFromLeftBottom(400, CGFloat(Int.random(in: 170 ... (674 - Int(node.size.height)))))
                timeLayer[time].append(node)
            }
        }
        
        func makeLayer3Random() -> (SKTexture, CGSize) {
            let first = Int.random(in: 11 ... 13)
            let second = Int.random(in: 1 ... 20)
            let result = "\(first)-\(second)"
            var bgSize = CGSize()
            
            switch second % 4 {
            case 1:
                bgSize = CGSize(width: 2, height: 2)
            case 2:
                bgSize = CGSize(width: 3, height: 3)
            case 3:
                bgSize = CGSize(width: 4, height: 4)
            case 0:
                bgSize = CGSize(width: 5, height: 5)
            default:
                break
            }
            
            return (SKTexture(imageNamed: result), bgSize)
        }
        
        func makeLayer2Random() -> (SKTexture, CGSize) {
            let first = Int.random(in: 1...9)
            var size = CGSize()
            
            
            switch first % 3 {
            case 1:
                size = CGSize(width: 10, height: 10)
            case 2:
                size = CGSize(width: 8, height: 8)
            case 0:
                size = CGSize(width: 6, height: 6)
            default:
                break
            }
            
            return (SKTexture(imageNamed: "21-\(first)"), size)
        }
        
        func makeLayer1Random() -> (SKTexture, CGSize) {
            let first = Int.random(in: 1...3)
            let second = Int.random(in: 1...4)
            
            var size = CGSize()
            
            switch second % 4 {
            case 1:
                size = CGSize(width: 40, height: 1)
            case 2:
                size = CGSize(width: 50, height: 2)
            case 3:
                size = CGSize(width: 60, height: 4)
            case 0:
                size = CGSize(width: 70, height: 8)
            default:
                break
            }
            return (SKTexture(imageNamed: "3\(first)-\(second)"), size)
        }
    }
}

extension GameManager: PassRotationingAstronautPointDelegate {
    
    func passAstronautPoint(at point: CGPoint) {
        if point.x < 0 || point.x > scene!.size.width || point.y < 170 || point.y > 674 {
            scene?.isPaused = true
            delegate?.showAlert(alertType: .fail)
        }
    }
}

extension GameManager: SendThroatGaugeDelegate {
    func send(gague: CGFloat) {
        let temp = gague * 100
        
        self.throatGauge = Int(temp)
    }
}
