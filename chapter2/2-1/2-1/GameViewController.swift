//
//  GameViewController.swift
//  2-1
//
//  Created by mengyang_guo on 2018/7/25.
//  Copyright © 2018年 gmy. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = self.view as! SKView
        if (skView.scene == nil) {
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.showsDrawCount = true
            skView.showsQuadCount = true
            let scene = GameScene.init(size: skView.bounds.size)
            skView.presentScene(scene)
        }
    }

//    override var shouldAutorotate: Bool {
//        return true
//    }
//
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            return .allButUpsideDown
//        } else {
//            return .all
//        }
//    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
