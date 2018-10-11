//
//  GameScene.swift
//  4-6
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
//        test2()
        test3()
        
    }
    
    func test0() -> Void {
        let backgroundNode = SKSpriteNode(imageNamed: "2")
        backgroundNode.size = self.size
        backgroundNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundNode.setScale(1.05)
        
        let sprite0 = SKSpriteNode(imageNamed: "1")
        sprite0.position = CGPoint(x: self.frame.midX - 200, y: self.frame.midY)
        sprite0.size = CGSize(width: 50, height: 50)
        
        addChild(backgroundNode)
        addChild(sprite0)
        
        let customAction = SKAction.customAction(withDuration: 2) { (node, elapsedTime) in
            print(elapsedTime)
            node.setScale(elapsedTime)
        }
        let repeatForeverAction = SKAction.repeatForever(customAction)
        sprite0.run(repeatForeverAction)
    }
    
    func test1() -> Void {
        let backgroundNode = SKSpriteNode(imageNamed: "2")
        backgroundNode.size = self.size
        backgroundNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundNode.setScale(1.05)
        
        let sprite0 = SKSpriteNode(imageNamed: "1")
        sprite0.position = CGPoint(x: self.frame.midX - 200, y: self.frame.midY)
        sprite0.size = CGSize(width: 50, height: 50)
        
        addChild(backgroundNode)
        addChild(sprite0)
        
        
        let moveAction = SKAction.moveBy(x: 400, y: 0, duration: 1)
        sprite0.speed = 0.2;
        moveAction.speed = 5
        let reversedMoveAction = moveAction.reversed()
        let sequenceAction = SKAction.sequence([moveAction, reversedMoveAction])
        let repeatForeverAction = SKAction.repeatForever(sequenceAction)
        sprite0.run(repeatForeverAction)
        
        print(sprite0.speed)
        print(moveAction.speed)
    }
    
    func test2() -> Void {
        let backgroundNode = SKSpriteNode(imageNamed: "2")
        backgroundNode.size = self.size
        backgroundNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundNode.setScale(1.05)
        
        let sprite0 = SKSpriteNode(imageNamed: "1")
        sprite0.position = CGPoint(x: self.frame.midX - 200, y: self.frame.midY)
        sprite0.size = CGSize(width: 50, height: 50)
        
        addChild(backgroundNode)
        addChild(sprite0)
        
        let moveAction = SKAction.moveBy(x: 400, y: 0, duration: 1)
//        case linear
//        case easeIn
//        case easeOut
//        case easeInEaseOut
        moveAction.timingMode = SKActionTimingMode.easeIn
        let reversedMoveAction = moveAction.reversed()
        let sequenceAction = SKAction.sequence([moveAction, reversedMoveAction])
        let repeatForeverAction = SKAction.repeatForever(sequenceAction)
        sprite0.run(repeatForeverAction)
    }
    
    func test3() -> Void {
        
        let sprite0 = SKSpriteNode(imageNamed: "11")
        sprite0.position = CGPoint(x: self.frame.midX - 200, y: self.frame.midY)
        sprite0.size = CGSize(width: 50, height: 50)
        
        
        addChild(sprite0)
        
        
        let rotateAction = SKAction.rotate(byAngle: CGFloat(Double.pi * 2), duration: 1)
        let repeatForeverAction = SKAction.repeatForever(rotateAction)
        sprite0.run(repeatForeverAction)
        
        let waitAction = SKAction.wait(forDuration: 5)
        let removeAction = SKAction.removeFromParent()
        let sequenceAction = SKAction.sequence([waitAction, removeAction])
        sprite0.run(sequenceAction)
    }
}
