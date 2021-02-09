//
//  ContentView.swift
//  MUV-BattleRoyale
//
//  Created by Luis Pereira on 09/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Text("Let's play the game!")
            GameCenterAuthView()
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
