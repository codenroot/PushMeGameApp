//
//  GameScene.swift
//  PushMe
//
//  Created by Roberto Perez on 8/8/16.
//  Copyright (c) 2016 Roberto Perez. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate{
    
    var player:SKSpriteNode!
    var player2:SKSpriteNode!
    
    var initialPlayerPosition:CGPoint!
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let maximumPossibleForce = touch.maximumPossibleForce
            let force = touch.force
            let normalizedForce = force/maximumPossibleForce
            
            player.position.x = (self.size.width / 2) - normalizedForce * (self.size.width/2 - 25)
            player2.position.x = (self.size.width / 2) + normalizedForce * (self.size.width/2 - 25)
            
            
            
        }
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
       resetPlayerPosition()
    }
    
    func resetPlayerPosition() {
    player.position = initialPlayerPosition
    player2.position = initialPlayerPosition
        
        
    }
    
    
    override func didMoveToView(view: SKView) {
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        physicsWorld.contactDelegate = self
        addPlayer()
        addRow(RowType.twoS)
    
        
    }
    

    func addRandomRow () {
    
    let randomNumber = Int(arc4random_uniform(6))
        
        switch randomNumber {
        case 0:
            addRow(RowType(rawValue: 0)!)
            
            break
        case 1:
            addRow(RowType(rawValue: 1)!)
            break
        case 2:
            addRow(RowType(rawValue: 2)!)
            break
        case 3:
            addRow(RowType(rawValue: 3)!)
            break
        case 4:
            addRow(RowType(rawValue: 4)!)
            break
        case 5:
            addRow(RowType(rawValue: 5)!)
            break
        default:
            break
            
            
        }
        
    }
   
    
    
    var lastUpdateTimeInterval = NSTimeInterval()
    var lastYieldTimeInterval = NSTimeInterval()
    
    
    
    func updateWithTimeSinceLastUpdate (timeSinceLastUpdate:CFTimeInterval) {
        
        lastYieldTimeInterval += timeSinceLastUpdate
        if lastYieldTimeInterval > 0.6 {
        
        lastYieldTimeInterval = 0
            addRandomRow()
            
        
        
        }
        
        
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        
      var timeSinceLastUpdate = currentTime - lastUpdateTimeInterval
        lastUpdateTimeInterval = currentTime
        
        if timeSinceLastUpdate > 1 {
            
            
            timeSinceLastUpdate = 1/60
            lastUpdateTimeInterval = currentTime
            
        }
        
        updateWithTimeSinceLastUpdate(timeSinceLastUpdate)
        
        
        
        }
    
    func didBeginContact(contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == ("PLAYER") {
            print("GAMEOVER")
            showGameOver()
            
            // SHOW GAME OVER SCENE
        }
    }
    
    func showGameOver () {
        let transition = SKTransition.fadeWithDuration(0.5)
        let gameOverScene = GameOverScene(size: self.size)
        self.view?.presentScene(gameOverScene, transition: transition)
        
    }
    }


