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
    
    func setupModel() {
        var i = 0
        while (i < 10) {
            let newArray = [BlockTile]()
            self.twoDArray.append(newArray)
            i += 1
        }
    }
}
