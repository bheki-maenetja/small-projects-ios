//
//  BlockModel.swift
//  MobiGame
//
//  Created by Bheki Maenetja on 2020/07/06.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class BlockModel: Any {
    var twoDArray = [[BlockTile]]()
    weak var myGameScene: GameScene!
    
    func setupModel() {
        var i = 0
        while (i < 10) {
            let newArray = [BlockTile]()
            self.twoDArray.append(newArray)
            i += 1
        }
    }
    
    func populateModel() {
        var i = 0
        while (i < 10) {
            while (self.twoDArray[i].count < 10) {
                let dice = BlockUtils.randomNumber()
                let blockTile = self.myGameScene.setupSprite(dice)
                blockTile.outerIndex = i
                self.twoDArray[i].append(blockTile)
            }
            i += 1
        }
    }
}
