//
//  MenuScene.swift
//  AnimatedSprite
//
//  Created by Nathan on 23/03/2022.
//

import SpriteKit

class MenuScene: SKScene {

    var playButton = SKSpriteNode()
    let playButtonTex = SKTexture(imageNamed: "play")

    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "menuBackground")
        background.size = UIScreen.main.bounds.size
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = -1
       
        addChild(background)

        playButton = SKSpriteNode(texture: playButtonTex)
        playButton.position = CGPoint(x: frame.midX, y: frame.midY)
        self.addChild(playButton)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)

            if node == playButton {
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = GameScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            }
        }
    }
}

