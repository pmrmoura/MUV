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

struct GameCenterPresentMatch:UIViewControllerRepresentable{
    
    func makeUIViewController(context: Context) -> UIViewController{
        let vc = GameCenterHelperVC()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct ContentView: View {
    @State var presetMatchMaker = false
    var body: some View {
        VStack{
            ZStack{
                Text("ready to play")
                GameCenterAuthView()
            }
            Button("Online Match"){
                print("show matchmaker")
                presetMatchMaker.toggle()
            }.fullScreenCover(isPresented: $presetMatchMaker, content: {
                GameCenterPresentMatch()
            })
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
