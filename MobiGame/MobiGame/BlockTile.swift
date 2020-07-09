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
    
    func playSelect() {
        self.run(self.selectedSoundAction)
    }
    
    func playMatch() {
        self.run(self.magicSoundAction)
        
        let tileActions = [SKAction.scale(to: 1, duration: 0.5), SKAction.scale(to: 0.1, duration: 0.5), SKAction.fadeAlpha(to: 0, duration: 1)]
        let tileSequence = SKAction.sequence(tileActions)
        self.run(tileSequence)
        
        let exploder = (NSKeyedUnarchiver.unarchiveObject(withFile: Bundle.main.path(forResource: "matchparticle", ofType: "sks")!) as! SKEmitterNode)
        
        exploder.alpha = 0
        exploder.position = self.position
        exploder.zPosition = 99
        
        self.parent?.addChild(exploder)
        
        let actions = [SKAction.fadeAlpha(to: 1, duration: 1), SKAction.fadeAlpha(to: 0, duration: 1)]
        let explodesequence = SKAction.sequence(actions)
        
        exploder.run(explodesequence, completion: {
            self.removeFromParent()
            exploder.removeFromParent()
        })
        
    }
}
