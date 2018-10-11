//
//  GameScene.swift
//  5-1
//
//  Created by mengyang_guo on 2018/7/26.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func sceneDidLoad() {
        
        let sprite = SKSpriteNode(imageNamed: "1.jpg")
        sprite.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        addChild(sprite)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let tempTouches = touches as NSSet
        let touch = tempTouches.anyObject() as? UITouch
        
        if touch?.tapCount == 1 {
            let sprite = SKSpriteNode(imageNamed: "11.jpg")
            sprite.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            addChild(sprite)
        }
        if touch?.tapCount == 2 {
            let sprite = SKSpriteNode(imageNamed: "22.jpg")
            sprite.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            addChild(sprite)
        }
    }
}
