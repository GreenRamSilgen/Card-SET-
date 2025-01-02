//
//  SetViewModel.swift
//  Card SET!
//
//  Created by Kiran Shrestha on 12/17/24.
//

import Foundation

class SetViewModel : ObservableObject {
    private static func createSetGame() -> SetGameModel {
        return SetGameModel()
    }
    @Published private var setGameModel : SetGameModel = createSetGame()
    
    var currentDeck : [SetGameModel.Card] {
        setGameModel.deck
    }
    
    func generateDeck() {
        setGameModel.generateDeck()
    }
    
    func selectCard(_ card : SetGameModel.Card) {
        setGameModel.selectCard(card)
    }
    
    func shuffle() {
        setGameModel.shuffle()
    }
}
