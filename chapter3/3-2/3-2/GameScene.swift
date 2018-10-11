//
//  GameScene.swift
//  3-2
//
//  Created by mengyang_guo on 2018/7/25.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    lazy var splash: SKSpriteNode = {
        let splash = SKSpriteNode(imageNamed: "star_red")
        splash.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
//        splash.position = CGPoint(x: self.frame.maxX - 100, y: 100)
        splash.alpha = 0.5
        splash.color = SKColor.black
        splash.colorBlendFactor = 0.5
        splash.size = CGSize(width: 100, height: 100)
        return splash
    }()
    
    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
    let spriteMovePointsPerSec: Double = 20
    var location: CGPoint = CGPoint(x: 0, y: 0)
    var locationX: Double = 0.0
    var clicked: Bool = false
    
    override func sceneDidLoad() {
        
//        test0()
        
//        test1()
        
        test2()
    }
    
    func test0() -> Void {
        let backgroundNode = SKSpriteNode(imageNamed: "background")
        backgroundNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundNode.size = self.size
        addChild(backgroundNode)
        
        addChild(splash)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        clicked = true
        let touch = touches.first
        location = (touch?.location(in: self))!
        locationX = Double(location.x)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        if (clicked) {
            moveSprite()
        }
        boundsCheckSprite()
    }
    
    func moveSprite() -> Void {
        
        if locationX > Double(splash.position.x) {
            let amountToMove = Double(splash.position.x) + spriteMovePointsPerSec
            splash.position = CGPoint(x: amountToMove, y: Double(splash.position.y))
        } else {
            let amountToMove = Double(splash.position.x) - spriteMovePointsPerSec
            splash.position = CGPoint(x: amountToMove, y: Double(splash.position.y))
        }
    }
    
    func boundsCheckSprite() -> Void {
        if splash.position.x <= 0 {
            splash.position.x = 0
        }
        if splash.position.x >= self.size.width {
            splash.position.x = self.size.width
        }
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        splash.setScale(2)
//
//        splash.xScale = 2
//        splash.yScale = 0.5
//
//        splash.zRotation = (CGFloat)(Double.pi / 2)
//
//        splash.isHidden = !splash.isHidden
//
//        splash.removeFromParent()
//
//        removeAllChildren()
//    }
    
    func test1() -> Void {
        
        let lily = SKSpriteNode(color: SKColor.white, size: CGSize(width: 300, height: 300))
        lily.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        addChild(lily)
//        let lilyNormalMap = lily.texture?.tex
//        lily.normalTexture =
        lily.lightingBitMask = 1
        lily.name = "Lily Pad"
        
        let lightSprite = SKLightNode()
        lightSprite.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        lightSprite.name = "lightSprite"
        lightSprite.categoryBitMask = 1
        lightSprite.ambientColor = SKColor.red
        addChild(lightSprite)
    }
    
    func test2() -> Void {
        let spriteTexture = SKTexture(imageNamed: "star_red")
        for i in 0..<7 {
            let sprite = SKSpriteNode(texture: spriteTexture)
            
            let tempI = Double(i)
            
            sprite.position = CGPoint(x: tempI * 120, y: 300)
            sprite.setScale(3)
            addChild(sprite)
        }
    }
    
    
    
}
