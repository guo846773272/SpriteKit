//
//  GameScene.swift
//  4-2
//
//  Created by mengyang_guo on 2018/7/26.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    lazy var playerSprite: SKSpriteNode = {
        let t1 = SKTexture(imageNamed: "Player_Right1")
        let playerSprite = SKSpriteNode(texture: t1)
        playerSprite.position = CGPoint(x: self.frame.midX - 200, y: 50)
        playerSprite.setScale(2.5)
        return playerSprite
    }()
    
    override func sceneDidLoad() {
        
        let backgroundNode = SKSpriteNode(imageNamed: "1")
        backgroundNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundNode.size = self.size
        
        
        
        
        
        addChild(backgroundNode)
        addChild(playerSprite)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = (touch?.location(in: self))!
        let t1 = SKTexture(imageNamed: "Player_Right1")
        let t2 = SKTexture(imageNamed: "Player_Right2")
        let t3 = SKTexture(imageNamed: "Player_Right3")
        let t4 = SKTexture(imageNamed: "Player_Right4")
        let textureArray = [t1, t2, t3, t4]
        let runRightAction = SKAction.animate(with: textureArray, timePerFrame: 0.1)
        let runForeverAction = SKAction.repeatForever(runRightAction)
        let moveAction = SKAction.move(to: CGPoint(x: location.x, y: playerSprite.position.y), duration: 2)
        let groupAction = SKAction.group([runForeverAction, moveAction])
        
        playerSprite.run(groupAction)
    }
}
