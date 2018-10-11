//
//  GameScene.swift
//  10-1
//
//  Created by mengyang_guo on 2018/7/28.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    lazy var triangleNode: SKSpriteNode = {
        let triangleNode = SKSpriteNode(imageNamed: "11")
        triangleNode.position = CGPoint(x: frame.midX, y: frame.midY)
        return triangleNode
    }()
    
    override func sceneDidLoad() {
        
        let backgroundNode = SKSpriteNode(imageNamed: "bg")
        backgroundNode.position = CGPoint(x: frame.midX, y: frame.midY)
        backgroundNode.size = self.size
        
        
        
        
        addChild(backgroundNode)
        addChild(triangleNode)
        
        
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        test0(touches: touches)
//        test1(touches: touches)
        test2(touches: touches)
        
        
    }
    
    
    func test0(touches: Set<UITouch>) -> Void {
        
        let tempTouches = touches as NSSet
        let touch = tempTouches.anyObject() as! UITouch
        let location = touch.location(in: self)
        
        let lblNode = SKLabelNode(text: "Hello")
        lblNode.position = location
        lblNode.fontColor = SKColor.purple
        addChild(lblNode)
        
        let physicsBody = SKPhysicsBody(rectangleOf: lblNode.frame.size)
        lblNode.physicsBody = physicsBody
    }
    
    func test1(touches: Set<UITouch>) -> Void {
        let trianglePath = CGMutablePath()
        trianglePath.move(to: CGPoint(x: 100, y: 600))
        trianglePath.addLine(to: CGPoint(x: 300, y: 600))
        trianglePath.addLine(to: CGPoint(x: 200, y: 700))
        trianglePath.closeSubpath()
        
        let node = SKShapeNode(path: trianglePath)
        addChild(node)
        
        node.physicsBody = SKPhysicsBody(polygonFrom: trianglePath)
    }
    
    func test2(touches: Set<UITouch>) -> Void {
        
        let tempTouches = touches as NSSet
        let touch = tempTouches.anyObject() as! UITouch
        let location = touch.location(in: self)
        
        let randomNum = arc4random_uniform(5) + 1
        let fileString = "\(randomNum).png"
        let spriteNode = SKSpriteNode(imageNamed: fileString)
        spriteNode.position = location
        
        addChild(spriteNode)
        
        spriteNode.physicsBody = SKPhysicsBody(rectangleOf: spriteNode.size)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
}
