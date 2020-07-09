//
//  BlockScene2.swift
//  MobiGame
//
//  Created by Bheki Maenetja on 2020/07/09.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit
import SpriteKit

class BlockScene2: SKScene {
    
    override func didMove(to view: SKView) {
        var thanksLabel: SKLabelNode!
        self.backgroundColor = UIColor.orange
        thanksLabel = SKLabelNode(fontNamed: "ArialMT")
        thanksLabel.horizontalAlignmentMode = .center
        thanksLabel.fontSize = 50
        thanksLabel.zPosition = 99
        thanksLabel.position = CGPoint(x: 0, y: -(self.frame.size.height / 2) + 80)
        thanksLabel.text = "Thank you for playing!"
        addChild(thanksLabel)
    }
    
}
