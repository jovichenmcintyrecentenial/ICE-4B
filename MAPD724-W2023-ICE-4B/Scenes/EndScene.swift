//
//  StartScene.swift
//  MAPD724-W2023-ICE-4B
//
//  Created by Jovi on 08/02/2023.
//


import SpriteKit
import GameplayKit
import AVFoundation
import UIKit



class EndScene: SKScene {
    
    var ocean1:Ocean?
    var ocean2:Ocean?

    
    override func sceneDidLoad() {
        
        screenWidth = frame.width
        screenHeight = frame.height

        name = "END"
    

        //add ocean
        ocean1 = Ocean()
        ocean2 = Ocean()
        ocean2?.position.y = -627
        addChild(ocean1!)
        addChild(ocean2!)
        

    }
    
    
    func touchDown(atPoint pos : CGPoint) {
       print("Touch Down")
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        print("Touch Moved")
    }
    
    func touchUp(atPoint pos : CGPoint) {
        print("Touch Up")

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        ocean1?.update()
        ocean2?.update()
        

    }
}


