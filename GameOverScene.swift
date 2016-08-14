//
//  GameOverScene.swift
//  PushMe
//
//  Created by Roberto Perez on 8/9/16.
//  Copyright © 2016 Roberto Perez. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.backgroundColor = SKColor.blackColor()
        let message = "GAME OVER"
        
        let label = SKLabelNode(fontNamed: "Optima-ExtraBalck")
        label.text = message
        label.fontColor = SKColor.whiteColor()
        label.position = CGPoint(x: self.size.width / 2,y: self.size.height / 2)
        
        addChild(label)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let transition = SKTransition.fadeWithDuration(0.5)
        let gameOverScene = GameOverScene(size: self.size)
        self.view?.presentScene(gameOverScene, transition: transition)
}

    
}
