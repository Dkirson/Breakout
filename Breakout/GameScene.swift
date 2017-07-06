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
    var ball = SKShapeNode()
    var paddle = SKSpriteNode()
    var brick = SKSpriteNode()
    var loseZone = SKSpriteNode()
    var score: Int = 0
    var numberOfLives: Int = 0
       
    override func didMove(to view: SKView)
    {
        physicsWorld.contactDelegate = self
       
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)// makes
        
        
        createBackground()
        makeBall()
        makePaddle()
        makeBrick()
        makeBrick2()
        makeBrick3()
        makeBrick4()
        makeBrick5()
        makeBrick6()
        makeBrick7()
        makeBrick8()
        makeBrick9()
        makeBrick10()
        makeBrick11()
        makeBrick12()
        makeLoseZone()

    }
            
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            paddle.position.x = location.x
            ball.physicsBody?.isDynamic = true
            ball.physicsBody?.applyImpulse(CGVector(dx: 5, dy: 5))
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            paddle.position.x = location.x
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let bodyAName = contact.bodyA.node?.name
        let bodyBName = contact.bodyB.node?.name

        // If two items colide, make the brick disappear and add 1 to your score
        
        if bodyAName == "Ball" && bodyBName == "brick" || bodyAName == "brick" && bodyBName == "Ball"{
            if bodyAName == "brick" {
                contact.bodyA.node?.removeFromParent()
                score += 1
            } else if bodyBName == "brick" {
                contact.bodyB.node?.removeFromParent()
                score += 1
            }
            
        }
        
        // If the ball goes into the loseZone, the game ends and displays your score
        
        if contact.bodyA.node?.name == "loseZone" ||
            contact.bodyB.node?.name == "loseZone" {
            numberOfLives += 1
            if numberOfLives < 3 {
                print("You are on life", numberOfLives + 1)
            }
            if numberOfLives == 3 {
                print("You Demolished", score, "Bricks!!\nBut You Still Lost!!")
                ball.removeFromParent()
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        // If you hit all of the bricks (and your score is equal to the number of bricks you created)
        // then you win and the game dispays your victory message
        
        if (score == 12) {
             print("You Won Dude!!!\nYou Totally Obliterated All", score, "Bricks!!")
            self.view?.isPaused = true
        }
            // If, instead of pausing the game, you want the ball to go away
            // but the background to keep running, then comment out the line above
            // and uncomment the line below
            // ball.removeFromParent()
        }

    

    
func createBackground() {
    let stars = SKTexture(imageNamed: "stars")
    for i in 0...1 {
        let starsBackground = SKSpriteNode(texture: stars)
        starsBackground.zPosition = -1
        starsBackground.position = CGPoint(x: 0, y: starsBackground.size.height * CGFloat(i))
        addChild(starsBackground)
        let moveDown = SKAction.moveBy(x: 0, y: -starsBackground.size.height, duration: 20)
        let moveReset = SKAction.moveBy(x:0, y: starsBackground.size.height, duration: 0)
        let moveLoop = SKAction.sequence([moveDown, moveReset])
        let moveForever = SKAction.repeatForever(moveLoop)
        starsBackground.run(moveForever)
    }
}
    
func makeBall() {
    ball = SKShapeNode(circleOfRadius: 10)
    ball.position = CGPoint(x: frame.midX, y: frame.midY)
    ball.strokeColor = UIColor.black
    ball.fillColor = UIColor.yellow
    ball.name = "Ball"
    ball.physicsBody = SKPhysicsBody(circleOfRadius: 10)
    ball.physicsBody?.isDynamic = false//ignores all forces and impulses
    ball.physicsBody?.usesPreciseCollisionDetection = true
    ball.physicsBody?.friction = 0
    ball.physicsBody?.affectedByGravity = false
    ball.physicsBody?.restitution = 1
    ball.physicsBody?.linearDamping = 0
    ball.physicsBody?.contactTestBitMask = (ball.physicsBody?.collisionBitMask)!
    
    addChild(ball)
    
    }

    func makePaddle() {
        paddle = SKSpriteNode(color: UIColor.white, size: CGSize(width: frame.width/4, height: 20))
            paddle.position = CGPoint(x: frame.midX, y: frame.minY + 125)
            paddle.name = "paddle"
            paddle.physicsBody = SKPhysicsBody(rectangleOf: paddle.size)
            paddle.physicsBody?.isDynamic = false
            addChild(paddle) 
    }
    
    func makeBrick() {
        brick = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 50, height: 20))
        brick.position = CGPoint(x: frame.maxX - 70, y: frame.maxY - 30)
        brick.name = "brick"
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick.physicsBody?.isDynamic = false
        addChild(brick) 
    }
    
    func makeBrick2() {
        brick = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 50, height: 20))
        brick.position = CGPoint(x: frame.maxX - 155, y: frame.maxY - 30)
        brick.name = "brick"
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick.physicsBody?.isDynamic = false
        addChild(brick)
    }
    
    func makeBrick3() {
        brick = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 50, height: 20))
        brick.position = CGPoint(x: frame.maxX - 240, y: frame.maxY - 30)
        brick.name = "brick"
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick.physicsBody?.isDynamic = false
        addChild(brick)
    }
    
    func makeBrick4() {
        brick = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 50, height: 20))
        brick.position = CGPoint(x: frame.maxX - 325, y: frame.maxY - 30)
        brick.name = "brick"
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick.physicsBody?.isDynamic = false
        addChild(brick)
    }
    
    func makeBrick5() {
        brick = SKSpriteNode(color: UIColor.green, size: CGSize(width: 50, height: 20))
        brick.position = CGPoint(x: frame.maxX - 70, y: frame.maxY - 60)
        brick.name = "brick"
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick.physicsBody?.isDynamic = false
        addChild(brick)
    }
    
    func makeBrick6() {
        brick = SKSpriteNode(color: UIColor.green, size: CGSize(width: 50, height: 20))
        brick.position = CGPoint(x: frame.maxX - 155, y: frame.maxY - 60)
        brick.name = "brick"
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick.physicsBody?.isDynamic = false
        addChild(brick)
    }
    
    func makeBrick7() {
        brick = SKSpriteNode(color: UIColor.green, size: CGSize(width: 50, height: 20))
        brick.position = CGPoint(x: frame.maxX - 240, y: frame.maxY - 60)
        brick.name = "brick"
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick.physicsBody?.isDynamic = false
        addChild(brick)
    }
    
    func makeBrick8() {
        brick = SKSpriteNode(color: UIColor.green, size: CGSize(width: 50, height: 20))
        brick.position = CGPoint(x: frame.maxX - 325, y: frame.maxY - 60)
        brick.name = "brick"
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick.physicsBody?.isDynamic = false
        addChild(brick)
    }
    
    func makeBrick9() {
        brick = SKSpriteNode(color: UIColor.red, size: CGSize(width: 50, height: 20))
        brick.position = CGPoint(x: frame.maxX - 70, y: frame.maxY - 90)
        brick.name = "brick"
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick.physicsBody?.isDynamic = false
        addChild(brick)
    }
    
    func makeBrick10() {
        brick = SKSpriteNode(color: UIColor.red, size: CGSize(width: 50, height: 20))
        brick.position = CGPoint(x: frame.maxX - 155, y: frame.maxY - 90)
        brick.name = "brick"
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick.physicsBody?.isDynamic = false
        addChild(brick)
    }
    
    func makeBrick11() {
        brick = SKSpriteNode(color: UIColor.red, size: CGSize(width: 50, height: 20))
        brick.position = CGPoint(x: frame.maxX - 240, y: frame.maxY - 90)
        brick.name = "brick"
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick.physicsBody?.isDynamic = false
        addChild(brick)
    }
    
    func makeBrick12() {
        brick = SKSpriteNode(color: UIColor.red, size: CGSize(width: 50, height: 20))
        brick.position = CGPoint(x: frame.maxX - 325, y: frame.maxY - 90)
        brick.name = "brick"
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick.physicsBody?.isDynamic = false
        addChild(brick)
    }

    func makeLoseZone() {
        let loseZone = SKSpriteNode(color: UIColor.clear, size: CGSize(width: frame.width, height: 50))
        loseZone.position = CGPoint(x: frame.midX, y: frame.minY + 25)
        loseZone.name = "loseZone"
        loseZone.physicsBody = SKPhysicsBody(rectangleOf: loseZone.size)
        loseZone.physicsBody?.isDynamic = false
        addChild(loseZone)

    }
    func scoreLabel() {
        let scoreLabel = SKLabelNode(text: "score +0")
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.maxX)
        scoreLabel.name = "scoreLabel"
//        scoreLabel.physicsBody = SKPhysicsBody(rectangleOf: scoreLabel.fontName = "scoreLabel +0")
        scoreLabel.physicsBody?.isDynamic = false
        addChild(scoreLabel)
    
    }
}

