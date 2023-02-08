import GameplayKit
import SpriteKit


class Player:GameObject{

    
    init() {
        super.init(imageString: "plane", initalScale: 2)
        start()
        reset()
    }
    
    override func start() {
        zPosition = Layer.plane.rawValue
        verticalSpeed = 0.5
    }
    
    override func update() {
        checkBounds()
    }
    
    override func checkBounds() {

        
        if(position.x <= -320){
            position.x = -320
        }
        
        if(position.x >= 320){
            position.x = 320
        }
        
    }
    
    override func reset() {
        position.y = -640
    }
    
    func touchesMove(point:CGPoint) {
        position.x = point.x
        
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
