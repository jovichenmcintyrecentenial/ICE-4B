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
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var liveLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = GKScene(fileNamed: "GameScene") {
            
            if let sceneNode = scene.rootNode as! GameScene? {
                
                sceneNode.scaleMode = .aspectFill
                
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = true
                }
            }
        }
        
        //init
        CollisionManager.gameViewController = self;
        ScoreManager.score = 0
        ScoreManager.lives = 5
        updateLivesLabel()
        updateScoreLabel()
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
}
