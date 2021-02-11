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
//    var spriteSheetName: String = ""
    init(){
        
        let scene = GameScene(fileNamed: "GameScene")
//        scene?.setSpriteSheet(fileName: self.spriteSheetName)
        self.scene = scene!
        self.scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
//        self.spriteSheetName = spriteSheetName
    }
}

struct Game: View {
    var champion: Champion

    @ObservedObject var loader = GameSceneLoader()
    @ObservedObject var motion = MotionManager()
    
    var body: some View {
        ZStack {
            VStack{
                SpriteView(scene: loader.scene)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .edgesIgnoringSafeArea(.all)
            }
            VStack {
                Text(motion.orientation == "Horizontal" ? "Mova para os lados" : "Mova para cima e para baixo")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding(.top, 42)
                ProgressView("", value: motion.score, total: 1000)
                    .frame(width: 200, alignment: .center)
                    .scaleEffect(CGSize(width: 1.0, height: 3))
                    .progressViewStyle(LinearProgressViewStyle(tint: .orange))
                if motion.score >= 1000 {
                    Text("Parabéns, você venceu")
                        .font(.system(size: 32, weight: .medium, design: .default))
                        .foregroundColor(.red)
                        .padding(.top, 42)
                }
                Spacer()
            }
        }
    }
}


struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game(champion: Champion(name: "Natchi Mágica", background: "BackgroundNatchi", picture: "NatchiPic", type: "Bruxa", file: "NatchiFile"))
    }
}
