//
//  TileMapLayer.swift
//  11-1
//
//  Created by mengyang_guo on 2018/7/28.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit

class TileMapLayer: SKNode {

    var tileSize: CGSize = CGSize()
    var atlas: SKTextureAtlas? = nil
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    init(tileSize: CGSize) {
        super.init()
        self.tileSize = tileSize
    }
    
    convenience init(atlasName: String, tileSize: CGSize, tileCodes: [String]) {
        self.init(tileSize: tileSize)
        atlas = SKTextureAtlas(named: atlasName)
        print(atlas?.textureNames)
        for row in 0..<tileCodes.count {
            let line = tileCodes[row]
            for column in 0..<line.count {
                let indexStart = line.index(line.startIndex, offsetBy: column)
                let char = line[indexStart]
                let spriteNode = getNode(char: char)
                spriteNode?.position = getPosition(row: row, column: column)
                addChild(spriteNode!)
            }
        }
        
    }
    
    func getNode(char: Character) -> SKSpriteNode? {
        var spriteNode: SKSpriteNode? = nil
        switch char {
        case "x": do {
            spriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "wall"))
            }
        case "o": do {
            spriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "grass"))
            }
        default:
            return nil
        }
        spriteNode?.size = tileSize
        spriteNode?.blendMode = .replace
//        spriteNode?.texture?.filteringMode = .nearest
        return spriteNode
    }
    
    func getPosition(row: Int, column: Int) -> CGPoint {
        
        return CGPoint(x: Double(column) * Double(tileSize.width) + Double(tileSize.width) * 0.5, y: Double(row) * Double(tileSize.height) + Double(tileSize.height) * 0.5)
    }
}
