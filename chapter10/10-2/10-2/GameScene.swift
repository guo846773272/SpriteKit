//
//  GameScene.swift
//  10-2
//
//  Created by mengyang_guo on 2018/7/28.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    lazy var circleNode: SKSpriteNode = {
        let circleNode = SKSpriteNode(imageNamed: "2")
        circleNode.position = CGPoint(x: frame.midX - 250, y: frame.maxY - circleNode.size.height / 2)
        addChild(circleNode)
        
        return circleNode
    }()
    
    override func sceneDidLoad() {
        
        let squareNode = SKSpriteNode(imageNamed: "1")
        squareNode.position = CGPoint(x: frame.midX, y: frame.maxY - squareNode.size.height / 2)
        addChild(squareNode)
        let squareAction = SKAction.run {
            squareNode.physicsBody = SKPhysicsBody(rectangleOf: squareNode.size)
        }
        let squareWaitAction = SKAction.wait(forDuration: 2)
        let squareSequenceAction = SKAction.sequence([squareWaitAction, squareAction])
        squareNode.run(squareSequenceAction)
        
        
        let circleAction = SKAction.run {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
            self.circleNode.physicsBody = SKPhysicsBody(rectangleOf: self.circleNode.size)
        }
        let circleWaitAction = SKAction.wait(forDuration: 2)
        let circleSequenceAction = SKAction.sequence([circleWaitAction, circleAction])
        circleNode.run(circleSequenceAction)
        
        let triangleNode = SKSpriteNode(imageNamed: "4")
        triangleNode.position = CGPoint(x: frame.midX + 250, y: frame.maxY - triangleNode.size.height / 2)
        let trianglePath = CGMutablePath()
        trianglePath.move(to: CGPoint(x: triangleNode.frame.origin.x, y: triangleNode.frame.origin.y))
        trianglePath.addLine(to: CGPoint(x: triangleNode.frame.origin.x + triangleNode.size.width, y: triangleNode.frame.origin.y))
        trianglePath.addLine(to: CGPoint(x: triangleNode.frame.origin.x + triangleNode.size.width / 2, y: triangleNode.frame.origin.y + triangleNode.size.height))
        trianglePath.addLine(to: CGPoint(x: triangleNode.frame.origin.x, y: triangleNode.frame.origin.y))
//        trianglePath.closeSubpath()
        let triangleShapeNode = SKShapeNode(path: trianglePath)
        triangleShapeNode.addChild(triangleNode)
        triangleShapeNode.strokeColor = SKColor.clear
        addChild(triangleShapeNode)
        let triangleAction = SKAction.run {
            triangleShapeNode.physicsBody = SKPhysicsBody(polygonFrom: trianglePath)
        }
        let triangleWaitAction = SKAction.wait(forDuration: 2)
        let triangleSequenceAction = SKAction.sequence([triangleWaitAction, triangleAction])
        triangleNode.run(triangleSequenceAction)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        let sandAction = SKAction.run {
            let x = Double(arc4random_uniform(UInt32(self.size.width)))
            let sandNode = SKSpriteNode(imageNamed: "3")
            sandNode.position = CGPoint(x: x, y: Double(self.size.height))
            sandNode.physicsBody = SKPhysicsBody(circleOfRadius: sandNode.size.width / 2)
            sandNode.name = "snadNode"
            self.addChild(sandNode)
        }
        run(SKAction.repeat(SKAction.sequence([
            SKAction.wait(forDuration: 0.1),
            sandAction
            ]), count: 60))
        
        circleNode.physicsBody?.applyForce(CGVector(dx: 1000 * 8, dy: 0))
    }
}
