//
//  BlockUtils.swift
//  MobiGame
//
//  Created by Bheki Maenetja on 2020/07/06.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class BlockUtils: Any {
    
    class func randomNumber() -> Int {
        return Int(arc4random_uniform(UInt32(5))) + 1
    }
    
}
