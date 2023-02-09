//
//  GameViewController.swift
//  MAPD724-W2023-ICE-4B
//
//  Created by Jovi on 08/02/2023.
//
//
//  GameViewController.swift
//  MAPD724-W2023-ICE-3B
//
//  Created by Jovi on 01/02/2023.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var currentScene:GKScene?
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var liveLabel: UILabel!
    
    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentStartScene()
        
//        if let scene = GKScene(fileNamed: "GameScene") {
//
//            if let sceneNode = scene.rootNode as! GameScene? {
//
//                sceneNode.scaleMode = .aspectFill
//
//                if let view = self.view as! SKView? {
//                    view.presentScene(sceneNode)
//                    view.ignoresSiblingOrder = true
//                }
//            }
//        }
        presentStartScene()
        //init
        CollisionManager.gameViewController = self;



    }
    
    func updateLivesLabel(){
        liveLabel.text = "Live: \(ScoreManager.lives)"
    }
    
    func updateScoreLabel(){
        scoreLabel.text = "Score: \(ScoreManager.score)"

    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setScene(sceneName:String) {
        
        currentScene = GKScene(fileNamed: sceneName)
        
        if let scene = currentScene!.rootNode as! SKScene? {
            
            scene.scaleMode = .aspectFill
            
            if let view = self.view as! SKView? {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
        
    }
    
    func presentStartScene(){
        scoreLabel.isHidden = true
        liveLabel.isHidden = true
        
        startLabel.isHidden = false
        startButton.isHidden = false
        
        setScene(sceneName: "StartScene")
    }
    
    func presentEndScene(){
        
    }
    
    func presentGameScene(){
        scoreLabel.isHidden = false
        liveLabel.isHidden = false
        
        startLabel.isHidden = true
        startButton.isHidden = true
        
        setScene(sceneName: "GameScene")
        
        
        ScoreManager.score = 0
        ScoreManager.lives = 5
        updateLivesLabel()
        updateScoreLabel()
    }
    
    @IBAction func startButtonPressEvent(_ sender: Any) {
        presentGameScene()
    }
}
