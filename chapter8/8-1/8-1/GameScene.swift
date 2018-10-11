//
//  GameScene.swift
//  8-1
//
//  Created by mengyang_guo on 2018/7/27.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let sparkEmitterNode = (SKEmitterNode(fileNamed: "FireFlies.sks"))!
    
    override func sceneDidLoad() {
        
//        test0()
//        test1()
//        test2()
        test3()
        
    }
    
    func test0() -> Void {
        let snowNode = SKEmitterNode(fileNamed: "Snow.sks")
        snowNode?.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        addChild(snowNode!)
    }
    
    func test1() -> Void {
        
        let backgroundNode = SKSpriteNode(imageNamed: "background.jpg")
        backgroundNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        addChild(backgroundNode)
        
        let snowTexture = SKTexture(imageNamed: "snow.png")
        let emitterNode = SKEmitterNode()
        emitterNode.particleTexture = snowTexture
        emitterNode.particleBirthRate = 80
        emitterNode.particleLifetime = 2.0
        emitterNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        emitterNode.particleSpeed = -450
        emitterNode.particleColor = SKColor.purple
        emitterNode.particleSpeedRange = 150
        emitterNode.particleScale = 0.2
        emitterNode.particleAlpha = 0.75
        emitterNode.particleAlphaRange = 0.5
        emitterNode.particleColorBlendFactor = 1
        emitterNode.particleScale = 0.2
        emitterNode.particleScaleRange = 0.5
        emitterNode.particlePositionRange = CGVector(dx: self.size.width, dy: 200)
        
        addChild(emitterNode)
    }
    
    func test2() -> Void {
        let backgroundNode = SKSpriteNode(imageNamed: "background-1.jpg")
        backgroundNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        backgroundNode.setScale(0.9)
        self.addChild(backgroundNode)
        
        let rainTexture = SKTexture(imageNamed: "rainDrop.png")
        let emitterNode = SKEmitterNode()
        emitterNode.particleTexture = rainTexture
        emitterNode.particleBirthRate = 80.0
        emitterNode.particleColor = SKColor.white
        emitterNode.particleSpeed = -450
        emitterNode.particleSpeedRange = 150
        emitterNode.particleLifetime = 2.0
        emitterNode.particleScale = 0.2
        emitterNode.particleAlpha = 0.75
        emitterNode.particleAlphaRange = 0.5
        emitterNode.particleColorBlendFactor = 1
        emitterNode.particleScale = 0.2
        emitterNode.particleScaleRange = 0.5
        emitterNode.particleScaleSpeed = -0.1;
        emitterNode.position = CGPoint(
            x: self.frame.midX, y: self.size.height)
        emitterNode.particlePositionRange =
            CGVector(dx: self.size.width, dy: 10)
        addChild(emitterNode)
    }
    
    func test3() -> Void {
//        let sparkEmitterNode = (SKEmitterNode(fileNamed: "FireFlies.sks"))!
        sparkEmitterNode.position = CGPoint(x: self.frame.midX, y: self.size.height)
        addChild(sparkEmitterNode)
        
        let leftMoveAction = SKAction.move(to: CGPoint(x: self.frame.midX - 200, y: self.size.height), duration: 2)
        let rightMoveAction = SKAction.move(to: CGPoint(x: self.frame.midX + 200, y: self.size.height), duration: 2)
        let sequenceAction = SKAction.sequence([leftMoveAction, rightMoveAction])
        let repeatForeverAction = SKAction.repeatForever(sequenceAction)
        sparkEmitterNode.run(repeatForeverAction)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        sparkEmitterNode.resetSimulation()
        sparkEmitterNode.particleColor = UIColor(displayP3Red: CGFloat(Double(arc4random_uniform(256)) / 255.0), green: CGFloat(Double(arc4random_uniform(256)) / 255.0), blue: CGFloat(Double(arc4random_uniform(256)) / 255.0), alpha: 1)
    }
}
