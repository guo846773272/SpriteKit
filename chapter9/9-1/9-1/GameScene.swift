//
//  GameScene.swift
//  9-1
//
//  Created by mengyang_guo on 2018/7/27.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func sceneDidLoad() {
        
//        test0()
//        test1()
//        test2()
//        test3()
//        test4()
//        test5()
        test6()

    }
    
    func test0() -> Void {
        let node0 = SKSpriteNode(imageNamed: "1.jpg")
        node0.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        node0.setScale(0.9)
        
        let node1 = SKSpriteNode(imageNamed: "2.png")
        node1.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        addChild(node0)
        addChild(node1)
    }
    
    func test1() -> Void {
        
        let node0 = SKSpriteNode(imageNamed: "1.jpg")
        node0.setScale(0.9)
        
        let cropNode = SKCropNode()
        cropNode.addChild(node0)
        
        cropNode.maskNode = SKSpriteNode(imageNamed: "3.png")
        
        let node1 = SKSpriteNode(imageNamed: "2.png")
        node1.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        addChild(node1)
        node1.addChild(cropNode)
    }
    
    func test2() -> Void {
        let midX = Double(self.frame.midX)
        let midY = Double(self.frame.midY)
        let rect = CGRect(x: midX - 200, y: midY - 100, width: 400, height: 200)
//        let rectNode = SKShapeNode(rect: rect)
        let rectNode = SKShapeNode(rect: rect, cornerRadius: 40)
        rectNode.lineWidth = 20
        rectNode.strokeColor = SKColor.purple
        rectNode.glowWidth = 20
        rectNode.fillColor = SKColor.green
        
        addChild(rectNode)
    }
    
    func test3() -> Void {
        let midX = Double(self.frame.midX)
        let midY = Double(self.frame.midY)
        let circleNode = SKShapeNode(circleOfRadius: 40)
        circleNode.position = CGPoint(x: midX, y: midY)
        
        addChild(circleNode)
    }
    
    func test4() -> Void {
        let midX = Double(self.frame.midX)
        let midY = Double(self.frame.midY)
        let rect = CGRect(x: midX - 200, y: midY - 100, width: 400, height: 200)
        let circularNode = SKShapeNode(ellipseIn: rect)
        
        addChild(circularNode)
    }
    
    func test5() -> Void {
        let midX = Double(self.frame.midX)
        let midY = Double(self.frame.midY)
        let circularNode = SKShapeNode(ellipseOf: CGSize(width: 400, height: 200))
        circularNode.position = CGPoint(x: midX, y: midY)
        
        addChild(circularNode)
    }
    
    func test6() -> Void {
        
        let lineNode = SKShapeNode()
        lineNode.position = CGPoint(x: 200, y: 100)
        
        let paths = CGMutablePath.init()
        // 判断路径是否为空
        print(paths.isEmpty)
        // 添加路径
        paths.move(to: CGPoint.init(x: 10, y: 200))
        paths.addLine(to: CGPoint.init(x: 20, y: 100))
        paths.addLine(to: CGPoint.init(x: 80, y: 300))
//        paths.addLine(to: CGPoint.init(x: 300, y: 150))
        // 判断路径是否为空
        print(paths.isEmpty)
        // 获取路径当前的点
        print(paths.currentPoint)
        // 返回包含路径的最小矩形（包含二次曲线）
        print(paths.boundingBox)
        // 返回包含路径的最小矩形（不包含二次曲线）
        print(paths.boundingBoxOfPath)
        // 清楚路径
//        paths.closeSubpath()
        
        
        lineNode.path = paths
        lineNode.lineWidth = 10
        lineNode.strokeColor = SKColor.purple
        
        addChild(lineNode)
    }
}
