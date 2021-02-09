//
//  ContentView.swift
//  MUV-BattleRoyale
//
//  Created by Luis Pereira on 09/02/21.
//

import SwiftUI
import GameKit

struct GameCenterAuthView:UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = GameCenterHelperVC()
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

struct ContentView: View {
    var body: some View {
        ZStack{
            if GKLocalPlayer.local.isAuthenticated{
                Text("not ready to play")
            }else{
                Text("ready to play")
                GameCenterAuthView()
            }
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
