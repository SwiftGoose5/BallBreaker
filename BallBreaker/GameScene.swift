//
//
//
// Created by Swift Goose.
// Copyright (c) 2022 Swift Goose. All rights reserved.
//
// YouTube: https://www.youtube.com/channel/UCeHYBwcVqOoyyNHiAf3ZrLg
//


import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let player = Player()
    let borders = Borders()
    let platform = Platform()
    var lives = [Life]()
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = .zero
        
        addChild(player)
        addChild(borders)
        addChild(platform)
        
        addLives()
        setCamera()
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if player.launched {
            platform.run(.moveTo(x: pos.x - platform.size.width / 2, duration: 0.2))
        } else {
            player.run(.moveTo(x: pos.x, duration: 0))
            platform.run(.moveTo(x: pos.x - platform.size.width / 2, duration: 0))
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if player.launched {
            platform.run(.moveTo(x: pos.x - platform.size.width / 2, duration: 0.2))
        } else {
            player.run(.moveTo(x: pos.x, duration: 0))
            platform.run(.moveTo(x: pos.x - platform.size.width / 2, duration: 0))
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
        if !player.launched {
            player.physicsBody?.applyImpulse(CGVector(dx: 5, dy: 5))
            player.launched = true
        }
        
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
        // Called before each frame is rendered
    }
}

extension GameScene {
    func addLives() {
        for index in 0 ..< player.totalLives {
            let life = Life()
            life.position.x = CGFloat(-50 + index * 60)
            lives.append(life)
        }
        
        for life in lives {
            addChild(life)
        }
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        let sortedNodes = [nodeA, nodeB].sorted { $0.name ?? "" < $1.name ?? "" }
        
        let firstNode = sortedNodes[0]
        let secondNode = sortedNodes[1]

        print("firstNode: \(firstNode.name)  |  secondNode: \(secondNode.name)")
        
        if firstNode.name! == "border_bottom", secondNode.name! == "player" {
            player.resetPosition(platformPosition: platform.position)
            lives[player.currentLives - 1].loseLife()
        }
    }
}

extension GameScene {
    func setCamera() {
        let camera = SKCameraNode()
        camera.setScale(1)
        addChild(camera)
        scene!.camera = camera
    }
}

enum CollisionType: UInt32 {
    case player = 1
    case border = 2
    case platform = 4
    case brick = 8
    case powerup = 16
}
