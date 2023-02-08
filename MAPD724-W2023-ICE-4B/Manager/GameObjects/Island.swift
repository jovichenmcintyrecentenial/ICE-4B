import GameplayKit
import SpriteKit


class Island:GameObject{

    
    init() {
        super.init(imageString: "island", initalScale: 2)
        start()
        reset()
    }
    
    override func start() {
        zPosition = Layer.island.rawValue
        verticalSpeed = 5
    }
    
    override func checkBounds() {
        if(position.y <= -876){
            reset()

        }
    }
    
    override func update() {
        move()
        checkBounds()
    }
    
    func move(){
        self.position.y -= verticalSpeed!
    }
    

    override func reset() {
        position.y = 876
        let randX:Int = (randomSource?.nextInt(upperBound: 626))!-313
        position.x = CGFloat(randX)
        isColliding = false
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
