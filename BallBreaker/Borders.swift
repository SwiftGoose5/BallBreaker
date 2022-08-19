//
//
//
// Created by Swift Goose.
// Copyright (c) 2022 Swift Goose. All rights reserved.
//
// YouTube: https://www.youtube.com/channel/UCeHYBwcVqOoyyNHiAf3ZrLg
//


import SpriteKit

class Borders: SKNode {
    
    let topBorder = SKShapeNode()
    let leftBorder = SKShapeNode()
    let rightBorder = SKShapeNode()
    let bottomBorder = SKShapeNode()
    
    override init() {
        super.init()
        
        buildBorders(frame: CGRect(x: 0, y: 0, width: 700, height: 1450))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildBorders(frame: CGRect) {
        topBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width, height: 100))
        topBorder.physicsBody?.isDynamic = false
        topBorder.physicsBody?.affectedByGravity = false
        
        topBorder.physicsBody?.friction = 0.0
        topBorder.physicsBody?.restitution = 0.0
        topBorder.physicsBody?.linearDamping = 0.0
        topBorder.physicsBody?.angularDamping = 0.0
        
        topBorder.physicsBody?.categoryBitMask = CollisionType.platform.rawValue
        topBorder.physicsBody?.collisionBitMask = CollisionType.player.rawValue
        topBorder.physicsBody?.contactTestBitMask = CollisionType.player.rawValue
        
        topBorder.name = "border_top"
        topBorder.position = .init(x: 0, y: frame.height / 2)
        addChild(topBorder)
        
        
        
        leftBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: frame.height))
        leftBorder.physicsBody?.isDynamic = false
        leftBorder.physicsBody?.affectedByGravity = false
        
        leftBorder.physicsBody?.friction = 0.0
        leftBorder.physicsBody?.restitution = 0.0
        leftBorder.physicsBody?.linearDamping = 0.0
        leftBorder.physicsBody?.angularDamping = 0.0
        
        leftBorder.physicsBody?.categoryBitMask = CollisionType.platform.rawValue
        leftBorder.physicsBody?.collisionBitMask = CollisionType.player.rawValue
        leftBorder.physicsBody?.contactTestBitMask = CollisionType.player.rawValue
        
        leftBorder.name = "border_left"
        leftBorder.position = .init(x: -frame.width / 2, y: 0)
        addChild(leftBorder)
        
        
        
        rightBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: frame.height))
        rightBorder.physicsBody?.isDynamic = false
        rightBorder.physicsBody?.affectedByGravity = false
        
        rightBorder.physicsBody?.friction = 0.0
        rightBorder.physicsBody?.restitution = 0.0
        rightBorder.physicsBody?.linearDamping = 0.0
        rightBorder.physicsBody?.angularDamping = 0.0
        
        rightBorder.physicsBody?.categoryBitMask = CollisionType.platform.rawValue
        rightBorder.physicsBody?.collisionBitMask = CollisionType.player.rawValue
        rightBorder.physicsBody?.contactTestBitMask = CollisionType.player.rawValue
        
        rightBorder.name = "border_right"
        rightBorder.position = .init(x: frame.width / 2, y: 0)
        addChild(rightBorder)
        
        
        
        bottomBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width, height: 100))
        bottomBorder.physicsBody?.isDynamic = false
        bottomBorder.physicsBody?.affectedByGravity = false
        
        bottomBorder.physicsBody?.friction = 0.0
        bottomBorder.physicsBody?.restitution = 0.0
        bottomBorder.physicsBody?.linearDamping = 0.0
        bottomBorder.physicsBody?.angularDamping = 0.0
        
        bottomBorder.physicsBody?.categoryBitMask = CollisionType.platform.rawValue
        bottomBorder.physicsBody?.collisionBitMask = CollisionType.player.rawValue
        bottomBorder.physicsBody?.contactTestBitMask = CollisionType.player.rawValue
        
        bottomBorder.name = "border_bottom"
        bottomBorder.position = .init(x: 0, y: -frame.height / 2)
        addChild(bottomBorder)
    }
}
