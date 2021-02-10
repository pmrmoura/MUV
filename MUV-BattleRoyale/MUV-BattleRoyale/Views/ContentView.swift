//
//  ContentView.swift
//  MUV-BattleRoyale
//
//  Created by Luis Pereira on 09/02/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            MainView()
        }.accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
        }
        .accentColor(.white)
    }
}

struct MainView: View {
    var champions: [Champion] = [
        Champion(name: "Natchi Mágica", background: "BackgroundNatchi", picture: "NatchiPic", type: "Bruxa"),
        Champion(name: "Alluka", background: "BackgroundAlluka", picture: "AllukaPic", type: "Espadachin"),
        Champion(name: "José Gomes", background: "BackgroundJose", picture: "JosePic", type: "Normal"),
        Champion(name: "Erou", background: "BackgroundErou", picture: "ErouPic", type: "Arqueiro"),
    ]

    var columns: [GridItem] =
            Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack {
                TitleView()
                Spacer()
                
                LazyVGrid(columns: columns) {
                    ForEach(champions, id: \.self) { champion in
                        ChampionView(champion: champion)
                    }
                }
            
                Spacer()
            }
//            GameCenterAuthView()
            
        }
    }
}

struct TitleView: View {
    var body: some View {
        Text("Escolha seu \n campeão")
            .font(.system(size: 40, weight: .medium))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
    }
}

private struct ChampionView: View {
    var champion: Champion

    enum PushedItem: String {
        case selectChampion
        case confirmSelection
    }

    @State var isChampionSelected: PushedItem? = .selectChampion

    var body: some View {
        VStack {
            NavigationLink(
                destination: ConfirmSelection(champion: champion)) {
                ZStack {
                    Image(champion.background)
                    VStack(alignment: .center) {
                        Image(champion.picture)
                            .frame(width: 100, height: 100)
                        Text(champion.name)
                            .font(.system(size: 18, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                .frame(width: 150, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            }
        }
    }
}
