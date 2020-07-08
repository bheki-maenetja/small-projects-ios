//
//  GameScene.swift
//  MobiGame
//
//  Created by Bheki Maenetja on 2020/07/06.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var gameModel = BlockModel()
    
    func setup() {
        self.gameModel.myGameScene = self
        self.gameModel.setupModel()
        self.gameModel.populateModel()
        self.arrangeTiles()
    }
    
    func setupSprite(_ withImage:Int) -> BlockTile {
        let sprite = BlockTile(imageNamed: "tile_" + String(withImage))
        
        sprite.tileType = withImage
        sprite.xScale = 0.75
        sprite.yScale = 0.75
        
        self.addChild(sprite)
        
        return sprite
    }
    
    func gridInformation() -> (margin: CGFloat, tileSize: CGFloat, startY: CGFloat) {
        let gridMargin = CGFloat(20)
        let tileSize = (UIScreen.main.bounds.size.width - CGFloat(gridMargin * 2)) / 10
        let startY = (tileSize * 10) + gridMargin
        return (margin: gridMargin, tileSize: tileSize, startY: startY)
    }
    
    func arrangeTiles() {
        let gridInfo = self.gridInformation()
        var location = CGPoint(x: gridInfo.margin + (gridInfo.tileSize / 2), y: gridInfo.startY)
        
        var i = 0
        
        for verticalStrip in self.gameModel.twoDArray {
            var verticalCounter = 1
            for gameTile in verticalStrip {
                let convertedLocation = self.convertPoint(fromView: location)
                
                gameTile.run(SKAction.move(to: convertedLocation, duration: 0.1 * Double(verticalCounter)))
                location.y -= gridInfo.tileSize
                gameTile.outerIndex = i
                
                verticalCounter += 1
            }
            location.x += gridInfo.tileSize
            location.y = gridInfo.startY
            i += 1
        }
    }
    
    override func didMove(to view: SKView) {
        self.setup()
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
