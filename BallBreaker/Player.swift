//
//
//
// Created by Swift Goose.
// Copyright (c) 2022 Swift Goose. All rights reserved.
//
// YouTube: https://www.youtube.com/channel/UCeHYBwcVqOoyyNHiAf3ZrLg
//


import SpriteKit

class Player: SKShapeNode {
    
    var totalLives = 3
    var currentLives = 3
    
    var launched = false
    let radius = CGFloat(10)
    let startPoint = CGPoint(x: 0, y: -470)
    
    override init() {
        super.init()
        
        let customPath = CGMutablePath()
        customPath.addArc(center: CGPoint(x: 0, y: 0), radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        path = customPath
        
        strokeColor = .white
        fillColor = .white
        
        name = "player"
        
        physicsBody = SKPhysicsBody(circleOfRadius: radius)
        physicsBody?.categoryBitMask = CollisionType.player.rawValue
        physicsBody?.collisionBitMask = CollisionType.platform.rawValue | CollisionType.border.rawValue | CollisionType.brick.rawValue | CollisionType.powerup.rawValue
        physicsBody?.contactTestBitMask = CollisionType.platform.rawValue | CollisionType.border.rawValue | CollisionType.brick.rawValue | CollisionType.powerup.rawValue
        physicsBody?.isDynamic = true
        physicsBody?.affectedByGravity = false
        physicsBody?.allowsRotation = false
        
        physicsBody?.friction = 0.0
        physicsBody?.restitution = 1.0
        physicsBody?.linearDamping = 0.0
        physicsBody?.angularDamping = 0.0
        
        position = startPoint
    }
    
    func resetPosition(platformPosition: CGPoint) {
        physicsBody?.velocity = CGVector(dx: 0, dy: 0)
//        position.x = platformPosition.x + 50
//        position.y = platformPosition.y
        position = startPoint
        print("player: \(position)")
        print("platform: \(platformPosition)")
        launched = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
