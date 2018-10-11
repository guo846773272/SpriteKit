//
//  GameScene.swift
//  4-1
//
//  Created by mengyang_guo on 2018/7/25.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    lazy var starSprite: SKSpriteNode = {
        let starSprite = SKSpriteNode(imageNamed: "star_red")
        starSprite.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        starSprite.size = CGSize(width: 50, height: 50)
        return starSprite
    }()
    
    var playableRect: CGRect? = nil
    
    override func sceneDidLoad() {
        
        let backgroundNode = SKSpriteNode(imageNamed: "background")
        backgroundNode.size = self.size
        backgroundNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundNode.setScale(1.05)
        
        addChild(backgroundNode)
        addChild(starSprite)
        
//        test0()
//        test1()
//        test2()
//        test3()
//        test4()
//        test5()
//        test6()
//        test7()
//        test8()
//        test9()
//        test10()
//        test11()
        test12()
    }
    
    func test0() -> Void {
        
        let starMoveAction = SKAction.move(to: CGPoint(x: 200, y: 100), duration: 2)
        starSprite.run(starMoveAction)
    }
    
    func test1() -> Void {
        
//        let negDelta = CGVector(dx: -200, dy: -100)
//        let starMoveAction = SKAction.move(by: negDelta, duration: 2)
        let starMoveAction = SKAction.moveBy(x: -200, y: -100, duration: 2)
        starSprite.run(starMoveAction)
    }
    
    func test2() -> Void {
        
        let action0 = SKAction.move(to: CGPoint(x: size.width, y: 0), duration: 2)
        let action1 = SKAction.move(to: CGPoint(x: size.width, y: size.height), duration: 2)
        let sequence = SKAction.sequence([action0, action1])
        starSprite.run(sequence)
    }
    
    func test3() -> Void {
        let leftMoveAction = SKAction.move(to: CGPoint(x: self.frame.midX - 100, y: self.frame.midY), duration: 0.5)
        let rightMoveAction = SKAction.move(to: CGPoint(x: self.frame.midX + 100, y: self.frame.midY), duration: 0.5)
        let sequenceAction = SKAction.sequence([leftMoveAction, rightMoveAction])
        let repeatCountAction = SKAction.repeat(sequenceAction, count: 3);
//        let repeatForeverAction = SKAction.repeatForever(sequenceAction)
        starSprite.run(repeatCountAction)
    }
    
    func test4() -> Void {
        
        let leftMoveAction = SKAction.move(to: CGPoint(x: self.frame.midX - 100, y: self.frame.midY), duration: 0.5)
        let waitAction = SKAction.wait(forDuration: 2)
        let rightMoveAction = SKAction.move(to: CGPoint(x: self.frame.midX + 100, y: self.frame.midY), duration: 0.5)
        let sequenceAction = SKAction.sequence([leftMoveAction, waitAction, rightMoveAction])
        let repeatForeverAction = SKAction.repeatForever(sequenceAction)
        starSprite.run(repeatForeverAction)
    }
    
    func test5() -> Void {
        
        let leftMoveAction = SKAction.move(to: CGPoint(x: self.frame.midX - 100, y: self.frame.midY), duration: 0.5)
//        let waitAction = SKAction.wait(forDuration: 2, withRange: 2)
        let waitAction = SKAction.wait(forDuration: 1, withRange: 2)
        let rightMoveAction = SKAction.move(to: CGPoint(x: self.frame.midX + 100, y: self.frame.midY), duration: 0.5)
        let sequenceAction = SKAction.sequence([leftMoveAction, waitAction, rightMoveAction])
        let repeatForeverAction = SKAction.repeatForever(sequenceAction)
        starSprite.run(repeatForeverAction)
    }
    
    func test6() -> Void {
        let zoomAction = SKAction.scale(to: 1, duration: 0.2)
        let shrinkAction = SKAction.scale(to: 0.1, duration: 0.2)
        let sequenceAction = SKAction.sequence([zoomAction, shrinkAction])
        let repeatForeverAction = SKAction.repeatForever(sequenceAction)
        starSprite.run(repeatForeverAction)
    }
    
    func test7() -> Void {
        let rotateAction = SKAction.rotate(toAngle: CGFloat(Double.pi * 2), duration: 1)
        let repeatForeverAction = SKAction.repeatForever(rotateAction)
        starSprite.run(repeatForeverAction)
    }
    
    func test8() -> Void {
        let resizeAction = SKAction.resize(toWidth: 100, height: 200, duration: 2)
        starSprite.run(resizeAction)
    }
    
    func test9() -> Void {
        let zoomAction = SKAction.scale(to: 2, duration: 1)
        let shrinkAction = SKAction.scale(to: 0.2, duration: 1)
        let sequenceAction = SKAction.sequence([zoomAction, shrinkAction])
        let rotateAction = SKAction.rotate(byAngle: CGFloat(Double.pi * 2), duration: 1)
        let groupAction = SKAction.group([sequenceAction, rotateAction])
        let repeatForeverAction = SKAction.repeatForever(groupAction)
        starSprite.run(repeatForeverAction)
    }
    
    func test10() -> Void {
        let fadeOut = SKAction.fadeOut(withDuration: 0.5)
        let fadeIn = SKAction.fadeIn(withDuration: 0.5)
        let sequenceAction = SKAction.sequence([fadeOut, fadeIn])
        let repeatForeverAction = SKAction.repeatForever(sequenceAction)
        starSprite.run(repeatForeverAction)
    }
    
    func test11() -> Void {
        let hideAction = SKAction.fadeAlpha(to: 0, duration: 0.5)
        let showAction = SKAction.fadeAlpha(to: 1, duration: 0.5)
        let sequenceAction = SKAction.sequence([hideAction, showAction])
        let repeatForeverAction = SKAction.repeatForever(sequenceAction)
        starSprite.run(repeatForeverAction)
    }
    
    func test12() -> Void {
        let colorAction0 = SKAction.colorize(withColorBlendFactor: 0.8, duration: 0.5)
        let colorAction1 = SKAction.colorize(withColorBlendFactor: 0, duration: 0.5)
        let sequenceAction = SKAction.sequence([colorAction0, colorAction1])
        let repeatForeverAction = SKAction.repeatForever(sequenceAction)
        starSprite.run(repeatForeverAction)
    }
    
    func test13() -> Void {
        
    }
}
