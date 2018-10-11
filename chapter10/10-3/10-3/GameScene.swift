//
//  GameScene.swift
//  10-3
//
//  Created by mengyang_guo on 2018/7/28.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func sceneDidLoad() {
        
        let groundNode = SKSpriteNode(color: SKColor.purple, size: size)
        groundNode.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(groundNode)
        groundNode.physicsBody = SKPhysicsBody(rectangleOf: groundNode.size)
        groundNode.physicsBody?.isDynamic = false
        
        let centerShapeNode = SKShapeNode()
        let rect = CGRect(x: -10, y: -10, width: 20, height: 20)
        let path = UIBezierPath(ovalIn: rect).cgPath
        centerShapeNode.path = path
        let centerOfCircle = CGPoint(x: 200, y: 145)
        centerShapeNode.position = centerOfCircle
        addChild(centerShapeNode)
//        centerShapeNode.physicsBody = SKPhysicsBody(edgeChainFrom: path)
//        centerShapeNode.physicsBody = SKPhysicsBody(rectangleOf: centerShapeNode.frame.size)
        centerShapeNode.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        centerShapeNode.name = "centerShapeNode"
        let dAngle = Double.pi / 10;
        var first: SKNode? = nil
        var previous: SKNode? = nil
        for i in 0..<20 {

            let centerOfCircle = CGPoint(x: 150, y: 150)
            let a = dAngle * Double(i)
            let x = 100 * cos(a) + Double(centerOfCircle.x)
            let y = 100 * sin(a) + Double(centerOfCircle.y)
            let node = SKShapeNode()
            node.path = path
            node.position = CGPoint(x: x, y: y)
            addChild(node)

            node.physicsBody = SKPhysicsBody(edgeChainFrom: path)
            
            let joint = SKPhysicsJointSpring.joint(withBodyA: centerShapeNode.physicsBody!, bodyB: node.physicsBody!, anchorA: centerOfCircle, anchorB: node.position)
            joint.damping = 0.2
            joint.frequency = 10.0
            self.physicsWorld.add(joint)
            if previous != nil {
                let limit = SKPhysicsJointLimit.joint(withBodyA: previous!.physicsBody!, bodyB: node.physicsBody!, anchorA: previous!.position, anchorB: node.position)
                limit.maxLength = 30
                self.physicsWorld.add(limit)
            } else {
                first = node
            }
            previous = node
        }
        
        let limit = SKPhysicsJointLimit.joint(withBodyA: (previous?.physicsBody!)!, bodyB: first!.physicsBody!, anchorA: (previous?.position)!, anchorB: (first?.position)!)
        limit.maxLength = 30
        self.physicsWorld.add(limit)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let node = self.childNode(withName: "centerShapeNode")
//        node?.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 10000))
        node?.physicsBody?.applyForce(CGVector(dx: 1000 * 8, dy: 0))
    }
}
