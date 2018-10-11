//
//  GameScene.swift
//  2-1
//
//  Created by mengyang_guo on 2018/7/25.
//  Copyright © 2018年 gmy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    
    override func sceneDidLoad() {

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let nextScene = NewGameScene.init(size: self.size)
        let doors = SKTransition.doorway(withDuration: 0.5)
        view?.presentScene(nextScene, transition: doors)
    }
    
}
