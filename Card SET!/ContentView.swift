//
//  ContentView.swift
//  Card SET!
//
//  Created by Kiran Shrestha on 12/6/24.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel : SetViewModel
    var body: some View {
        VStack {
            Button("Game Deck Generation") {
                viewModel.generateDeck()
            }
            ScrollView{
                ForEach(viewModel.currentDeck, id: \.id) { card in
                    Button(action: {
                        viewModel.selectCard(card)
                    }){
                        SetCard(cardInfo: card)
                    }
                }
            }
            
            Button("Deal 3 More Cards") {
//                setGameModel.dealThreeMoreCards()
            }
            Button("SHUFFLE") {
                viewModel.shuffle()
            }

        }
        .padding()
    }
}

struct SetCard: View {
    let cardInfo : SetGameModel.Card
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12).foregroundStyle(Color.cyan)
            
            Group {
                base
                switch cardInfo.shape {
                        case .diamond:
                    CustomShape.Diamond(customColor: cardInfo.getColor(), customStyle: cardInfo.shading, customAmount: cardInfo.numberOfShapes.rawValue).padding(20)
                        case .oval:
                            CustomShape.Ellipses(customColor: cardInfo.getColor(), customStyle: cardInfo.shading, customAmount: cardInfo.numberOfShapes.rawValue).padding(20)
                        case .squiggle:
                            CustomShape.Squiggle(customColor: cardInfo.getColor(), customStyle: cardInfo.shading, customAmount: cardInfo.numberOfShapes.rawValue).padding(20)
                }
            }
        }.padding()
        .saturation(cardInfo.isSelected ? 0.5 : 1)
            .contrast(cardInfo.isSelected ? 0.5 : 1)
            .opacity(cardInfo.matched ? 0 : 1)
    }
}
#Preview {
    ContentView(viewModel: SetViewModel())
}
