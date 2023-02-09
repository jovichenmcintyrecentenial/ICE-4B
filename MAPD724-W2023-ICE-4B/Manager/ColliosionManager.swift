//
//  ColliosionManager.swift
//  MAPD724-W2023-ICE-3B
//
//  Created by Jovi on 01/02/2023.
//

import GameplayKit
import SpriteKit

class CollisionManager{
    
    //ref for game controller
    public static var gameViewController:GameViewController?
    
    // Utility Func
    public static func SquaredDistance(p1:CGPoint,p2:CGPoint)->CGFloat{
        
        let deltaX: CGFloat = p2.x - p1.x
        let deltaY: CGFloat = p2.y - p1.y
        
        return deltaX*deltaX + deltaY*deltaY
    }
    
    //collsion func
    public static func sqauredRadisCheck(scene:SKScene,obj1:GameObject,obj2:GameObject){
        
        let p1 = obj1.position
        let p2 = obj2.position
        let p1Radius = obj1.halfHeight!
        let p2Radius = obj2.halfHeight!
        
        let radii = p1Radius + p2Radius
        
        //collision check if overlapping
        
        if(SquaredDistance(p1: p1, p2: p2) < radii * radii){
            
            //we have a collsion
            if(!obj2.isColliding!){
                
                
                switch(obj2.name){
                case "island":
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    ScoreManager.score += 100
                    gameViewController?.updateScoreLabel()
                    if(ScoreManager.score % 2000 == 0){
                        ScoreManager.lives += 1
                        gameViewController?.updateLivesLabel()

                    }

                    break
                case "cloud":
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    
                    if(ScoreManager.lives > 0) {
                        ScoreManager.lives -= 1
                        gameViewController?.updateLivesLabel()
                        
                        if(ScoreManager.lives <= 0){
                            gameViewController?.presentEndScene()
                        }
                    }
                    

                    break
                default:
                    break
                }
                
                obj2.isColliding = true

            }
        }
    }
}
