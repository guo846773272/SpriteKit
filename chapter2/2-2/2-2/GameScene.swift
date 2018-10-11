//
//  GameScene.swift
//  2-2
//
//  Created by mengyang_guo on 2018/7/25.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreGraphics

class GameScene: SKScene {
    
    let backgroundMovePointsPerSec: CGFloat = 100
    var dt: TimeInterval = 0;
    var lastUpdateTime: TimeInterval = 0
    
    func backgroundNode() -> SKSpriteNode {
        let backgroundNode = SKSpriteNode()
        
        let backgroundImgNode0 = SKSpriteNode(imageNamed: "bg0")
        backgroundImgNode0.anchorPoint = CGPoint(x: 0, y: 0)
        backgroundImgNode0.position = CGPoint(x: 0, y: 0)
        backgroundNode.addChild(backgroundImgNode0)
        
        let backgroundImgNode1 = SKSpriteNode(imageNamed: "bg1")
        backgroundImgNode1.anchorPoint = CGPoint(x: 0, y: 0)
        backgroundImgNode1.position = CGPoint(x: backgroundImgNode0.size.width, y: 0)
        backgroundNode.addChild(backgroundImgNode1)
        
        backgroundNode.size = CGSize(width: backgroundImgNode0.size.width + backgroundImgNode1.size.width, height: backgroundImgNode0.size.height)
        
        return backgroundNode;
    }
    
    override func sceneDidLoad() {
        
        for i in 0...1 {
            
            let tempI = i
            let doubleTempI = Double(tempI)
            
            let backgroundNode = self.backgroundNode()
            
            let width = backgroundNode.size.width
            let doubleWidth = Double(width)
            let pointX = doubleTempI * doubleWidth
            
            backgroundNode.position = CGPoint(x: pointX, y: 0)
            backgroundNode.name = "backgroundNode"
            addChild(backgroundNode)
        }
        
    }
    
    func moveBackground() -> Void {
        enumerateChildNodes(withName: "backgroundNode") { (node, _) in
            let backgroundNode = node as! SKSpriteNode
            let backgroundVelocity = -self.backgroundMovePointsPerSec
            var amountToMove = backgroundVelocity * CGFloat(self.dt) + backgroundNode.position.x
            if amountToMove <= -backgroundNode.size.width {
                amountToMove += backgroundNode.size.width * 2
            }
            backgroundNode.position = CGPoint(x: amountToMove, y: 0)
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        moveBackground()
    }
    
    func add(left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y);
    }
}
