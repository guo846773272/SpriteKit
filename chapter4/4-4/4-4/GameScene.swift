//
//  GameScene.swift
//  4-4
//
//  Created by mengyang_guo on 2018/7/26.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func sceneDidLoad() {
        
        let backgroundNode = SKSpriteNode(imageNamed: "2")
        backgroundNode.size = self.size
        backgroundNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundNode.setScale(1.05)
        
        let sprite = SKSpriteNode(imageNamed: "1")
        sprite.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        sprite.size = CGSize(width: 50, height: 50)
        
        
        
        addChild(backgroundNode)
        addChild(sprite)
        
        let moveAction = SKAction.moveBy(x: -200, y: 0, duration: 2)
//        sprite.run(moveAction)
        let reversedMoveAction = moveAction.reversed()
        sprite.run(reversedMoveAction)
    }
}
