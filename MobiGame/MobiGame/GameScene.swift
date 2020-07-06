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
    }
    
    func setupSprite(_ withImage:Int) -> BlockTile {
        let sprite = BlockTile(imageNamed: "tile_" + String(withImage))
        
        sprite.tileType = withImage
        sprite.xScale = 1.5
        sprite.yScale = 1.5
        
        self.addChild(sprite)
        
        return sprite
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
