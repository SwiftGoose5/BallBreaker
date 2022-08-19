//
//
//
// Created by Swift Goose.
// Copyright (c) 2022 Swift Goose. All rights reserved.
//
// YouTube: https://www.youtube.com/channel/UCeHYBwcVqOoyyNHiAf3ZrLg
//


import SpriteKit

class Life: SKShapeNode {
    
    let life: SKShapeNode!
    
    let radius = CGFloat(10)
    let containerRadius = CGFloat(20)
    
    let startPoint = CGPoint(x: 0, y: -550)
    
    
    override init() {
        life = SKShapeNode(circleOfRadius: radius)
        life.fillColor = .white
        life.strokeColor = .white
        life.zPosition = 1
        
        super.init()
        
        let lifePath = CGMutablePath()
        lifePath.addArc(center: CGPoint(x: 0, y: 0), radius: containerRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        path = lifePath
        
        strokeColor = .black
        fillColor = .black
        zPosition = -1
        
        position = startPoint
        
        addChild(life)
    }
    
    func loseLife() {
        life.run(.group([.scale(to: 1.5, duration: 0.2),
                         .fadeOut(withDuration: 0.2),
                         .sequence([.wait(forDuration: 0.3),
                                    .removeFromParent()])]))
        life.run(.group([.scale(to: 2, duration: 0)]))
    }
    
    func gainLife() {
        life.run(.group([.scale(to: 1, duration: 0.2),
                         .fadeIn(withDuration: 0.2)]))
        addChild(life)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
