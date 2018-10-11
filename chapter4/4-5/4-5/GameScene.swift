//
//  GameScene.swift
//  4-5
//
//  Created by mengyang_guo on 2018/7/26.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func sceneDidLoad() {
        
//        test0()
//        test1()
        test2()
    }
    
    func test0() -> Void {
        
        let backgroundNode = SKSpriteNode(imageNamed: "1")
        backgroundNode.size = self.size
        backgroundNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundNode.setScale(1.05)
        
        let sprite = SKSpriteNode(imageNamed: "2")
        sprite.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        sprite.setScale(0.1)
        
        addChild(backgroundNode)
        addChild(sprite)
        
        
        let moveAction = SKAction.moveTo(y: self.frame.midY - 50, duration: 3)
        let scaleAction = SKAction.scale(to: 1, duration: 3)
        let groupAction = SKAction.group([moveAction, scaleAction])
        sprite.run(groupAction)
    }
    
    func test1() -> Void {
        let starSprite0 = SKSpriteNode(imageNamed: "11")
        starSprite0.position = CGPoint(x: self.frame.midX - 240, y: self.frame.midY)
        starSprite0.setScale(0.5)
        
        let starSprite1 = SKSpriteNode(imageNamed: "22")
        starSprite1.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        starSprite1.setScale(0.5)
        
        let starSprite2 = SKSpriteNode(imageNamed: "33")
        starSprite2.position = CGPoint(x: self.frame.midX + 240, y: self.frame.midY)
        starSprite2.setScale(0.5)
        
        
        addChild(starSprite0)
        addChild(starSprite1)
        addChild(starSprite2)
        
        
        let hideAction = SKAction.hide()
        let showAction = SKAction.unhide()
        
        let waitAction0 = SKAction.wait(forDuration: 10)
        let sequenceAction0 = SKAction.sequence([hideAction, waitAction0, showAction, waitAction0])
        let repeatForeverAction0 = SKAction.repeatForever(sequenceAction0)
        starSprite0.run(repeatForeverAction0)
        
        let waitAction1 = SKAction.wait(forDuration: 5)
        let sequenceAction1 = SKAction.sequence([hideAction, waitAction1, showAction, waitAction1])
        let repeatForeverAction1 = SKAction.repeatForever(sequenceAction1)
        starSprite1.run(repeatForeverAction1)
        
        let waitAction2 = SKAction.wait(forDuration: 1)
        let sequenceAction2 = SKAction.sequence([hideAction, waitAction2, showAction, waitAction2])
        let repeatForeverAction2 = SKAction.repeatForever(sequenceAction2)
        starSprite2.run(repeatForeverAction2)
    }
    
    func test2() -> Void {
        let starSprite0 = SKSpriteNode(imageNamed: "11")
        starSprite0.position = CGPoint(x: self.frame.midX - 240, y: self.frame.midY)
        starSprite0.setScale(0.5)
        
        addChild(starSprite0)
        
        let block = SKAction.run {
            let rotateAction = SKAction.rotate(byAngle: CGFloat(Double.pi * 2), duration: 2)
            let repeatForeverAction = SKAction.repeatForever(rotateAction)
            starSprite0.run(repeatForeverAction)
        }
        starSprite0.run(block)
    }
    
}
