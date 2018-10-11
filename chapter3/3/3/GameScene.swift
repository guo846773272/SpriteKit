//
//  GameScene.swift
//  3
//
//  Created by mengyang_guo on 2018/7/25.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    
    override func sceneDidLoad() {

//        let splash = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 500, height: 500))
        let splash = SKSpriteNode(imageNamed: "tou_00000")
        splash.color = SKColor.blue
        splash.colorBlendFactor = 0.5
        splash.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        splash.anchorPoint = CGPoint(x: 1.0, y: 0.5)
        addChild(splash)
        
    }
    
    
}
