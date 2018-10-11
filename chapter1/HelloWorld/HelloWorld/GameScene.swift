//
//  GameScene.swift
//  HelloWorld
//
//  Created by mengyang_guo on 2018/7/25.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    override func sceneDidLoad() {
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = "this is SpriteKit"
        label.fontSize = 50
        label.fontColor = SKColor.blue
        label.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        addChild(label)
    }
    
    
}
