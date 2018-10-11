//
//  GameScene.swift
//  4-3
//
//  Created by mengyang_guo on 2018/7/26.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func sceneDidLoad() {
        let backgroundNode = SKSpriteNode(imageNamed: "2")
        backgroundNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundNode.size = self.size
        
        let sprite0 = SKSpriteNode(imageNamed: "1")
        sprite0.position = CGPoint(x: self.frame.midX - 200, y: self.frame.midY - 100)
        sprite0.setScale(0.2)
        
        let sprite1 = SKSpriteNode(imageNamed: "1")
        sprite1.position = CGPoint(x: self.frame.midX + 200, y: self.frame.midY + 100)
        sprite1.setScale(0.2)
        
        let playableRect = CGRect(x: self.frame.midX - 200, y: self.frame.midY - 100, width: 400, height: 200)
        let screenBordersPath = CGPath.init(rect: playableRect, transform: nil)
//        let followAction0 = SKAction.follow(screenBordersPath, duration: 10)
        let followAction0 = SKAction.follow(screenBordersPath, asOffset: false, orientToPath: false, duration: 2)
        let repeatAction0 = SKAction.repeatForever(followAction0)
        
        let circlePath = CGPath.init(roundedRect: CGRect(x: self.frame.midX - 160, y: self.frame.midY - 160, width: 320, height: 320), cornerWidth: 160, cornerHeight: 160, transform: nil)
//        let followAction1 = SKAction.follow(circlePath, duration: 10)
        let followAction1 = SKAction.follow(circlePath, asOffset: false, orientToPath: false, duration: 0.5)
        let repeatAction1 = SKAction.repeatForever(followAction1)
        
        
        
        addChild(backgroundNode)
        addChild(sprite0)
        addChild(sprite1)
        
        sprite0.run(repeatAction0)
        sprite1.run(repeatAction1)
    }
}
