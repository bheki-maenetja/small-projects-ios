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
    var matchLengthRequired = 3
    
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
    
    func switchTiles(_ firstPiece: BlockTile, otherPiece: BlockTile) {
        let firstPieceOuterIndex = firstPiece.outerIndex
        let otherPieceOuterIndex = otherPiece.outerIndex
        
        let firstPieceInnerIndex = self.twoDArray[firstPieceOuterIndex].firstIndex(of: firstPiece)
        let otherPieceInnerIndex = self.twoDArray[otherPieceOuterIndex].firstIndex(of: otherPiece)
        
        self.twoDArray[firstPieceOuterIndex].remove(at: firstPieceInnerIndex!)
        self.twoDArray[firstPieceOuterIndex].insert(otherPiece, at: firstPieceInnerIndex!)
        
        self.twoDArray[otherPieceOuterIndex].remove(at: otherPieceInnerIndex!)
        self.twoDArray[otherPieceOuterIndex].insert(firstPiece, at: otherPieceInnerIndex!)
        
        firstPiece.outerIndex = otherPieceOuterIndex
        otherPiece.outerIndex = firstPieceOuterIndex
    }
    
    func findMatches() -> [BlockTile] {
        var matches = [BlockTile]()
        let verticalMatches = self.findMatches(inStrips: self.twoDArray)
        matches.append(contentsOf: verticalMatches)
        
        let horizontalMatches = self.findMatches(inStrips: self.rotateGrid())
        matches.append(contentsOf: horizontalMatches)
        
        return matches
    }
    
    func findMatches(inStrips: [[BlockTile]]) -> [BlockTile] {
        var foundPieces = [BlockTile]()
        
        for strip in inStrips {
            var currentType = strip[0].tileType
            var i = 1
            
            var stack = [BlockTile]()
            stack.append(strip[0])
            
            while (i < strip.count) {
                let cp = strip[i]
                if (cp.tileType == currentType) {
                    stack.append(cp)
                } else {
                    if (stack.count >= self.matchLengthRequired) {
                        foundPieces.append(contentsOf: stack)
                    }
                    stack.removeAll()
                    currentType = strip[i].tileType
                    stack.append(strip[i])
                }
                i += 1
            }
            if (stack.count >= self.matchLengthRequired) {
                foundPieces.append(contentsOf: stack)
                stack.removeAll()
            }
        }
        return foundPieces
    }
    
    func rotateGrid() -> [[BlockTile]] {
        let length = self.twoDArray[0].count
        var returnValue = [[BlockTile]](repeating: [BlockTile](), count: length)
        for index in 0..<length {
            returnValue[index] = self.twoDArray.map {
                $0[index]
            }.reversed()
        }
        return returnValue
    }
    
    func removeTiles(_ tilesToRemove: [BlockTile]) {
        for tile in tilesToRemove {
            self.deleteTile(tile)
        }
    }
    
    func deleteTile(_ tile: BlockTile) {
        tile.playMatch()
        var i = 0
        while (i < self.twoDArray.count) {
            let verticalStrip = self.twoDArray[i]
            
            if verticalStrip.firstIndex(of: tile) != nil {
                self.twoDArray[i].remove(at: verticalStrip.firstIndex(of: tile)!)
            }
            i += 1
        }
    }
}
