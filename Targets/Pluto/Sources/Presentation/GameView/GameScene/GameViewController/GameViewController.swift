//
//  ViewController.swift
//  Pluto
//
//  Created by changgyo seo on 2023/07/10.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    var scene: GameScene?
    var gameConstants: GameConstants
    var map: [ObstacleProtocol]
    var gameManager: GameManager
    var gameAlertView = GameAlertView(frame: .zero, alertType: .pause)
    var tutorialView = UIView()
    
    init(gameConstants: GameConstants, map: [ObstacleProtocol]) {
        
        self.gameConstants = gameConstants
        self.map = map
        self.gameManager = GameManager(constants: gameConstants, map: map)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        super.loadView()
        self.view = SKView()
        self.view.bounds = UIScreen.main.bounds

    }
    // Usage example
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupScene()
    }

    func setupScene() {
        if let view = self.view as? SKView, scene == nil {
            
            gameManager.delegate = self
            let scene = gameManager.generateScene(size: view.bounds.size)
            view.presentScene(scene)
            self.scene = scene
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func addAlertView() {
        view.addSubview(gameAlertView)
        gameAlertView.translatesAutoresizingMaskIntoConstraints = false
        
        gameAlertView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        gameAlertView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        gameAlertView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        gameAlertView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func addTutorialView() {
        view.addSubview(tutorialView)
        
        tutorialView.translatesAutoresizingMaskIntoConstraints = false
        
        tutorialView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tutorialView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        tutorialView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tutorialView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension GameViewController: ShowAlertDelegate {
    
    func showAlert(alertType: GameAlertType) {
        scene?.isUserInteractionEnabled = false
        switch alertType {
        case .success:
            break
        case .fail:
            gameAlertView = GameAlertView(frame: .zero, alertType: .fail)
            gameManager.gameTimer.stopTimer()
            gameAlertView.upCompletion = restartGame
            gameAlertView.downCompletion = backToList
            addAlertView()
            
        case .pause:
            gameAlertView = GameAlertView(frame: .zero, alertType: .pause)
            gameManager.gameTimer.stopTimer()
            gameAlertView.upCompletion = pauseUpButtonAction
            gameAlertView.downCompletion = backToList
            addAlertView()
            
        case .tutorial(activate: let activates, bottomString: let bottomString, topString: let topString, imageName: let imageName, isLast: let isLast):
            
            var tutorial = TutorialView(frame: scene!.frame)
            tutorial.activates = [.changeGreen, .changeRed,  .turnClockWise, .ThroatGagueOne, .ThroatGagueTwo]
            //tutorial.delegate = self
            //tutorialView = tutorial.makeUIView()
            //tutorialView.backgroundColor = .clear
            //addTutorialView()
            view.addSubview(tutorial)
            
            tutorial.translatesAutoresizingMaskIntoConstraints = false
            
            tutorial.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            tutorial.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            tutorial.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            tutorial.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
    }
    
    func backToList() {
        gameManager.gameTimer.resetTimer()
        navigationController?.popViewController(animated: false)
    }
    
    func pauseUpButtonAction() {
        gameManager.gameTimer.restartTimer()
        gameAlertView.removeFromSuperview()
        gameManager.scene?.isPaused = false
        scene?.isUserInteractionEnabled = true
    }
    
    func restartGame() {
        
        gameAlertView.removeFromSuperview()
        
        if let view = self.view as? SKView {
            gameManager = GameManager(constants: self.gameConstants, map: stages[GameData.shared.selectedStage + 1].path)
            gameManager.delegate = self
            let scene = gameManager.generateScene(size: view.bounds.size)
            view.presentScene(scene)
            self.scene = scene
            setupScene()
            scene.isUserInteractionEnabled = true
        }
    }
}

extension GameViewController: ViewDismissDelegate {
    
    func dismiss() {
        gameManager.gameTimer.restartTimer()
        tutorialView.removeFromSuperview()
        gameManager.scene?.isPaused = false
        scene?.isUserInteractionEnabled = true
    }
}
