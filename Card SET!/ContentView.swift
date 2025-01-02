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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Game Deck Generation") {
                viewModel.generateDeck()
            }
            ScrollView{
                ForEach(viewModel.currentDeck, id: \.id) { card in
                    Button(action: {
                        viewModel.selectCard(card)
                    }){
                        HStack{
                            Image("\(card.shape.rawValue)\(card.shading.rawValue)\(card.numberOfShapes.rawValue)\(card.color)")
                                .saturation(card.isSelected ? 0.5 : 1)
                                .contrast(card.isSelected ? 0.5 : 1)
                                .opacity(card.matched ? 0 : 1)
                        }
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

#Preview {
    ContentView(viewModel: SetViewModel())
}
