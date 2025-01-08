//
//  SetGameModel.swift
//  Card SET!
//
//  Created by Kiran Shrestha on 12/6/24.
//

import Foundation
import SwiftUICore

struct SetGameModel {
    private var deck : [Card] = []
    private(set) var cardsInPlay: [Card] = []
    private(set) var setFoundCount : Int = 0
    private(set) var gameOver : Bool = false
    
    var selectedCards : [Card] = [] {
        didSet {
            if selectedCards.count == 3 {
                checkSelectedCardsForSet()
            }
            if selectedCards.count > 3 { // we already have 3 cards selected and are trying to select a new one. Reset the current ones and keep the last one only.
                for idx in cardsInPlay.indices {
                    if oldValue.contains(where: { $0.id == cardsInPlay[idx].id }) {
                        cardsInPlay[idx].isSelected = false
                    }
                }
                
                selectedCards = [selectedCards.last!]
            }
        }
    }
    
    init() {
        generateDeck()
        shuffle()
        for _ in 1...12 {
            drawCardFromDeck()
        }
    }
    
    func printCurrentDeck() {
        for card in cardsInPlay {
            print("Card \(card.id): \(card.numberOfShapes) \(card.color) \(card.shape) \(card.shading)")
        }
    }
        
    mutating func shuffle() {
        deck = deck.shuffled()
    }
    
    mutating func generateDeck() {
        for numberOfShapes in Card.NumberOfShapes.allCases {
            for color in Card.CardColor.allCases {
                for shape in Card.Shape.allCases {
                    for shading in Card.Shading.allCases {
                        deck.append(Card(id: deck.count, numberOfShapes: numberOfShapes, color: color.rawValue, shape: shape, shading: shading))
                    }
                }
            }
        }
    }
    
    mutating func drawCardFromDeck() {
        cardsInPlay.append(deck.removeLast())
    }
    
    mutating func isGameOver(){
        if deck.count == 0 {
            gameOver = true
        }
    }
    
    mutating func selectCard(_ card : Card) {
        guard gameOver == false else { return }
        if let selectedCardIdx = cardsInPlay.firstIndex(where: {$0.id == card.id}) {
            if cardsInPlay[selectedCardIdx].isSelected {
                // Card that was tapped is already selected to try to deselect it.
                cardsInPlay[selectedCardIdx].isSelected = false
                selectedCards = selectedCards.filter{cardsInPlay[selectedCardIdx].id != $0.id} //remove the "deselected" card from the selection array.
            } else {
                // Card that ws tapped is NOT Selected so mark as Selected.
                cardsInPlay[selectedCardIdx].isSelected = true
                selectedCards.append(cardsInPlay[selectedCardIdx])
            }
            
            for card in selectedCards {
                print("\(card.id): \(card.color): \(card.numberOfShapes): \(card.shading)")
            }
        }
    }
    
    mutating func checkSelectedCardsForSet() {
        let colorCount = Set(selectedCards.map {$0.color}).count
        let shadingCount = Set(selectedCards.map {$0.shading}).count
        let shapeCount = Set(selectedCards.map {$0.shape}).count
        let shapeAmountCount = Set(selectedCards.map {$0.numberOfShapes}).count
        
        //three selected cards are set via, color OR number of shapes OR shading OR shape
        var isSet = false
        if (colorCount == 1 || colorCount == 3) &&
            (shadingCount == 1 || shadingCount == 3) &&
            (shapeCount == 1 || shapeCount == 3) &&
            (shapeAmountCount == 1 || shapeAmountCount == 3)
        {
            isSet = true
            setFoundCount += 1
            cardsInPlay = cardsInPlay.filter { playingCard in
                !selectedCards.contains(where: { selectedCard in
                    playingCard.id == selectedCard.id
                })
            }
        }
            for idx in cardsInPlay.indices {
                if selectedCards.contains(where: { $0.id == cardsInPlay[idx].id }) {
                    if isSet {
                        cardsInPlay[idx].matched = true
                    }
                    cardsInPlay[idx].isSelected = false
                }
            }
    }
    
    struct Card {
        let id: Int
        let numberOfShapes: NumberOfShapes
        let color: String
        let shape: Shape
        let shading: Shading
        var isSelected: Bool = false
        var matched: Bool = false
        // cards are a set if one element all match
        // AND every other element is not matching.
        func getColor() -> Color {
            switch color {
                case "Green":
                    return .green
                case "Purple":
                    return .purple
                case "Red":
                    return .red
                default:
                return .blue
            }
        }
    }
}

// Possible states of Card values.
extension SetGameModel.Card {
    enum NumberOfShapes: Int, CaseIterable {
        case one = 1, two = 2, three = 3
    }
    enum CardColor: String, CaseIterable {
        case red = "Red", green = "Green", purple = "Purple"
    }
    enum Shape: String, CaseIterable {
        case diamond = "Diamond", squiggle = "Squiggle", oval = "Oval"
    }
    enum Shading: String, CaseIterable {
        case solid = "Solid", striped = "Striped", open = "Open"
    }
}
