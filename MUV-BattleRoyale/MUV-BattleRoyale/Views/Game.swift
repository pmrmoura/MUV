//
//  Game.swift
//  MUV-BattleRoyale
//
//  Created by Pedro Moura on 10/02/21.
//

import SwiftUI
import SpriteKit

struct Game: View {
    
    var scene: SKScene {
        let scene = SKScene(fileNamed: "GameScene.sks")
        scene?.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        scene?.scaleMode = .resizeFill
        return scene!
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}
