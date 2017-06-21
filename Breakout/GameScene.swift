//
//  GameScene.swift
//  Breakout
//
//  Created by David Kirson on 6/21/17.
//  Copyright © 2017 David Kirson. All rights reserved.
//

import SpriteKit
import GameplayKit
//add to use contact physics
class GameScene: SKScene, SKPhysicsContactDelegate
{
     var ball: SKSpriteNode!
    var paddle: SKSpriteNode!
    var brick: SKSpriteNode!
    
    override func didMove(to view: SKView)
    {
        self.physicsBody = SKPhysics(edgeLoopFrom: frame)// makes
       createBackground()
        generateBackground
        makeBall()
        concieveBrick()
}

func createBackground()
{
    let stars = SKTexture(imageNamed: "stars")

    for 1 in 0...1
    {
        let starsBackground = SKSpriteNode(texture: stars)
        
        starsBackground.zPosition = -1
        starsBackground.zPosition = CGPoint (x: 0.5 y: 0.5)
       
        starsBackground.zPosition = CGPoint (x: 0, y: (starsBackground.size.height * CGFloat(i) - CGFloat(1 * i)))
        addChild(starsBackground)
        let moveDown = SKAction.moveBy(x: 0, y: 0  -starsBackground.size.height, duration: 100)
        
        let reset = SKAction.moveBy(x:0, y: starsBackground.size.height, duration: 0)
        let moveLoop = SKAction.sequence([moveDown, reset])
        
        let loop = SKAction.repeatForever(moveLoop)
        
        starsBackground.run(loop)
    }
}
func makeBall()
{
    let ballDiameter = frame.width/20
    ball = SKSpriteNode(color: UIColor.red, size: CGSize(width: ballDiameter, height: ballDiameter))
    ball.name = "Ball"
    ball.physicsBody = SKPhysicsBody(rectangleOf: ball.size)
   
    
    ball.physicsBody?.isDynamic = true//ignores all forces and impulses
    ball.physicsBody?.usesPreciseCollisionDetection = true
    ball.physicsBody?.allowsRotation = false
    ball.physicsBody?.friction = 0
    ball.physicsBody?.affectedByGravity = false
    ball.physicsBody?.restitution = 1
    ball.physicsBody?.angularDamping = 0
    ball.physicsBody?.linearDamping = 0
    ball.physicsBody?.contactTestBitMask = (ball.physicsBody?.collisionBitMask!)
        
        addChild(Brick)
    
    }
    func constructLooseZone()
    {
        
    }
  
}
    
}
