//
//  ConfirmSelection.swift
//  MUV-BattleRoyale
//
//  Created by Pedro Moura on 10/02/21.
//

import SwiftUI

struct ConfirmSelection: View {
    var champion: Champion
    var body: some View {
            ZStack {
                BackgroundView()
                
                VStack {
                    Text(champion.name)
                        .font(.system(size: 32, weight: .bold, design: .default))
                        .foregroundColor(.white)

                    Text(champion.type)
                        .font(.system(size: 24, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    ChampionView(champion: champion)
                    
                    Spacer()
                    
                    ConfirmButton(champion: champion)
                }
            }
    }
}

struct ConfirmSelection_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmSelection(champion: Champion(name: "Natchi Mágica", background: "BackgroundNatchi", picture: "NatchiPic", type: "Bruxa", file: "NatchiFile"))
    }
}

private struct ChampionView: View {
    var champion: Champion

    var body: some View {
        ZStack {
            Image(champion.background)
                .resizable()
                .frame(width: 315, height: 359, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack(alignment: .center) {
                Image(champion.picture)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.bottom, 42)
            }
        }
        .frame(width: 315, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding()
    }
}

struct ConfirmButton: View {
    var champion: Champion
    var body: some View {
        VStack {
            NavigationLink(
                destination: Game(champion: champion)) {
                Text("Buscar partida")
                    .frame(width: 315, height: 60)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .cornerRadius(10)
                    .padding(.bottom, 42)
                .frame(width: 150, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            }
        }
    }
}
