//
//
//
// Created by Swift Goose.
// Copyright (c) 2022 Swift Goose. All rights reserved.
//
// YouTube: https://www.youtube.com/channel/UCeHYBwcVqOoyyNHiAf3ZrLg
//


import SpriteKit

class Platform: SKShapeNode {
    
    let startPoint = CGPoint(x: -50, y: -500)
    let size = CGSize(width: 100, height: 10)
    
    override init() {
        super.init()
        
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        let customPath = CGMutablePath()
        customPath.addRect(rect)
        path = customPath
        
        strokeColor = .white
        fillColor = .white
        
        name = "platform"
        
        physicsBody = SKPhysicsBody(rectangleOf: size, center: CGPoint(x: size.width / 2, y: size.height / 2))
        physicsBody?.categoryBitMask = CollisionType.platform.rawValue
        physicsBody?.collisionBitMask = CollisionType.player.rawValue | CollisionType.brick.rawValue | CollisionType.powerup.rawValue
        physicsBody?.contactTestBitMask = CollisionType.player.rawValue | CollisionType.brick.rawValue | CollisionType.powerup.rawValue
        physicsBody?.isDynamic = false
        physicsBody?.affectedByGravity = false
        physicsBody?.allowsRotation = false
        
        physicsBody?.friction = 0.0
        physicsBody?.restitution = 0.0
        physicsBody?.linearDamping = 0.0
        physicsBody?.angularDamping = 0.0
        
        position = startPoint
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
