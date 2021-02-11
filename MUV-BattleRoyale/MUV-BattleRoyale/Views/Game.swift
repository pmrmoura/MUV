//
//  Game.swift
//  MUV-BattleRoyale
//
//  Created by Pedro Moura on 10/02/21.
//

import SwiftUI
import SpriteKit

class GameSceneLoader: ObservableObject{
    
    
    
    @Published var scene : GameScene
    
    init(){
        
        let scene = GameScene(fileNamed: "GameScene")
        
        
        self.scene = scene!
        self.scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
}

struct Game: View {
    @ObservedObject var loader = GameSceneLoader()
    @ObservedObject var motion = MotionManager()
    
    var body: some View {
        ZStack {
            SpriteView(scene: loader.scene)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)
            Text(motion.orientation)
        }
    }
}


struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}
