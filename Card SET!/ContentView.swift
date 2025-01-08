//
//  ContentView.swift
//  Card SET!
//
//  Created by Kiran Shrestha on 12/6/24.
//

import SwiftUI

struct ContentView: View {
    var twoColumns = [GridItem(.flexible()), GridItem(.flexible())]
    var threeColumns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var fourColumns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @ObservedObject var viewModel : SetViewModel
    var body: some View {
        HStack{
            Text("Timer")
            Spacer()
            Text("Set")
            Spacer()
            Text("Points: \(viewModel.getSetFoundPoints())")
        }.padding(EdgeInsets(top: 0,leading: 10,bottom: 0,trailing: 10))
        VStack {
            GeometryReader { geometry in
                let screenWidth = geometry.size.width
                //                    let screenHeight = geometry.size.height
                let cardHeight = screenWidth / (viewModel.currentDeck.count <= 12 ? 2.4 : 3)
                ZStack{
                    ScrollView{
                        LazyVGrid(columns: viewModel.currentDeck.count < 24 ? threeColumns : fourColumns) {
                            ForEach(viewModel.currentDeck, id: \.id) { card in
                                Button(action: {
                                    viewModel.selectCard(card)
                                }){
                                    SetCard(cardInfo: card, cardHeight: cardHeight)
                                }
                            }
                        }
                    }
                    .zIndex(0)
                    Rectangle()
                        .foregroundStyle(.background)
                        .opacity(viewModel.checkIfGameIsOver ? 1 : 0)
                        .zIndex(viewModel.checkIfGameIsOver ? 99 : -2)
                    Text("GAME OVER")
                        .opacity(viewModel.checkIfGameIsOver ? 1 : 0)
                        .font(.largeTitle)
                        .zIndex(viewModel.checkIfGameIsOver ? 100 : -1)
                }
            }
            
            HStack{
                Button("DEAL") {
                    viewModel.drawThreeCards()
                }
                Spacer()
                Button("RESET") {
                    //
                    viewModel.generateDeck()
                }
            }
        }
        .padding()
    }
}

struct SetCard: View {
    let cardInfo : SetGameModel.Card
    let cardHeight : CGFloat
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12).foregroundStyle(Color.white).shadow(radius: CGFloat(5))
            
            Group {
                base
                switch cardInfo.shape {
                case .diamond:
                    CustomShape.Diamond(customColor: cardInfo.getColor(), customStyle: cardInfo.shading, customAmount: cardInfo.numberOfShapes.rawValue).padding(10)
                case .oval:
                    CustomShape.Ellipses(customColor: cardInfo.getColor(), customStyle: cardInfo.shading, customAmount: cardInfo.numberOfShapes.rawValue).padding(10)
                case .squiggle:
                    CustomShape.Squiggle(customColor: cardInfo.getColor(), customStyle: cardInfo.shading, customAmount: cardInfo.numberOfShapes.rawValue).padding(12)
                }
            }
        }
        .frame(height: cardHeight) // TODO: Adjust size of card to be more uniform/better looking.
        .saturation(cardInfo.isSelected ? 0.5 : 1)
        .contrast(cardInfo.isSelected ? 0.5 : 1)
        .opacity(cardInfo.matched ? 0 : 1)
    }
}
#Preview {
    ContentView(viewModel: SetViewModel())
}
