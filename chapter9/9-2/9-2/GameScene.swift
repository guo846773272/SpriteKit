//
//  GameScene.swift
//  9-2
//
//  Created by mengyang_guo on 2018/7/28.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    lazy var effectNode: SKEffectNode = {
        let effectNode = SKEffectNode()
        effectNode.position = CGPoint(x: frame.midX, y: frame.midY)
        
        let spriteNode = SKSpriteNode(imageNamed: "1.jpg")
        effectNode.addChild(spriteNode)
        return effectNode
    }()
    
    override func sceneDidLoad() {
        
        
        addChild(effectNode)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let filter = CIFilter(name: "CIGaussianBlur")
        filter?.setDefaults()
        let value = NSNumber.init(value: 10.0)
        filter?.setValue(value, forKey: "inputRadius")
        effectNode.filter = filter!
    }
}
