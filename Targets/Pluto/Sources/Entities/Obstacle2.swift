//
//  CreativeObject.swift
//  Pluto
//
//  Created by 홍승완 on 2023/07/14.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SpriteKit

protocol ObstacleProtocol {
    
    var point: CGPoint { get set } // size
    var size: CGSize { get set } // point
    var color: AstronautColor { get set } // 임시이긴 하지만 해당 노드의 색을 나타내주는 변수
    var path: Int { get set } // 궤도 path
    var imageName: String { get set } // image name
    var isClockWise: Bool { get set } // path가 시계방향이면 true, path가 반시계이면 false
}

extension ObstacleProtocol {
    
    func makePlanetNode() -> PlanetNode {

        let planet = PlanetNode()
        planet.position = CGPoint(x: 500, y: 674 - (point.y - 80))
        planet.size = size
        let image = UIImage(named: imageName)
        let texture = SKTexture(image: image!)
        planet.texture = texture
        planet.astronautColor = color
        planet.path = CreativeObject.pathList[path]
        planet.isClockWise = isClockWise
        planet.physicsBody = SKPhysicsBody(polygonFrom: CreativeObject.pathList[path])
        planet.name = "planet"
        planet.physicsBody?.categoryBitMask = 4
        planet.physicsBody?.contactTestBitMask = 1
        planet.physicsBody?.collisionBitMask = 0
        
        return planet
    }
}
