//
//  GameScene.swift
//  10-4
//
//  Created by mengyang_guo on 2018/7/28.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let circularNode = SKShapeNode(circleOfRadius: 50)
    var bearNode: SKSpriteNode? = nil
    lazy var textureArray: NSMutableArray? = {
        let array = NSMutableArray()
        return array
    }()
    
    override func sceneDidLoad() {
        
        self.physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.categoryBitMask = BitMaskType.scene
        
        circularNode.position = CGPoint(x: 100, y: 300)
        addChild(circularNode)
        circularNode.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        circularNode.fillColor = SKColor.purple
        circularNode.physicsBody?.categoryBitMask = BitMaskType.ball
        circularNode.physicsBody?.contactTestBitMask = BitMaskType.scene
        
        for i in 0..<8 {
            let texture = SKTexture(imageNamed: "bear\(i + 1)")
            textureArray?.add(texture)
        }
        let texture = SKTexture(imageNamed: "bear1")
        bearNode = SKSpriteNode(texture: texture)
        bearNode?.position = CGPoint(x: 600, y: 100)
        addChild(bearNode!)
        bearNode?.physicsBody = SKPhysicsBody(rectangleOf: texture.size())
        bearNode?.physicsBody?.categoryBitMask = BitMaskType.bear
        bearNode?.physicsBody?.contactTestBitMask = BitMaskType.ball
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        walking()
    }
    
    func walking() -> Void {
        let runRightAction = SKAction.animate(withNormalTextures: textureArray! as! [SKTexture], timePerFrame: 0.1)
        let repeatForeverAction = SKAction.repeatForever(runRightAction)
        let moveAction = SKAction.move(to: CGPoint(x: 200, y: 200), duration: 2)
        let groupAction = SKAction.group([repeatForeverAction, moveAction])
        bearNode?.run(groupAction)
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (BitMaskType.scene | BitMaskType.ball) {
            let alert = UIAlertView()
            alert.title = "红色小球和边界碰撞"
            alert.addButton(withTitle: "Cancel")
            alert.show()
        }
        if (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (BitMaskType.ball | BitMaskType.bear) {
            let alert = UIAlertView()
            alert.title = "红色小球和熊碰撞"
            alert.addButton(withTitle: "Cancel")
            alert.show()
        }
    }
}
