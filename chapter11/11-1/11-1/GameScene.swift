//
//  GameScene.swift
//  11-1
//
//  Created by mengyang_guo on 2018/7/28.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func sceneDidLoad() {
        
        let widthHeight = Double(self.size.width / 32)
        let tileMapNode = TileMapLayer(atlasName: "scenery", tileSize: CGSize(width: widthHeight, height: widthHeight), tileCodes: [
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxoooooooooooooooooooooooooooox",
            "xoooooooooooooooooooooooooooooox",
            "xoooooooooooooooooooooooooooooox",
            "xoooooooooooooooooooooooooooooox",
            "xoooooooooooooooooooooooooooooox",
            "xoooooooooooooooooooooooooooooox",
            "xoooooooooooooooooooooooooooooox",
            "xoooooooooooooooooooooooooooooox",
            "xoooooooooooooooooooooooooooooox",
            "xoooooooooooooooooooooooooooooox",
            "xoooooooooooooooooooooooooooooox",
            "xoooooooooooooooooooooooooooooox",
            "xoooooooooooooooooooooooooooooox",
            "xoooooooooooooooooooooooooooooox",
            "xoooooooooooooooooooooooooooooox",
            "xoooooooooooooooooooooooooooooox",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
            ])
        addChild(tileMapNode)
        
        let node = SKNode()
        node.zPosition = 50
        node.position = CGPoint(x: 100, y: 200)
        node.setScale(2)
        addChild(node)
        
        let atlas = SKTextureAtlas(named: "player")
//        let texture = atlas.textureNamed("player")
        let texture = SKTexture(imageNamed: "player")
        texture.filteringMode = .nearest
        let spriteNode = SKSpriteNode(texture: texture)
        node.addChild(spriteNode)
    }
}
