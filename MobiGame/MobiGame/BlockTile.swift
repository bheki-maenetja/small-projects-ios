//
//  BlockTile.swift
//  MobiGame
//
//  Created by Bheki Maenetja on 2020/07/06.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit
import SpriteKit

class BlockTile: SKSpriteNode {
    var tileType = 0
    var outerIndex = 0
    
    let selectedSoundAction = SKAction.playSoundFileNamed("selection.wav", waitForCompletion: false)
    let magicSoundAction = SKAction.playSoundFileNamed("explosion.wav", waitForCompletion: false)
}
