//
//  SetGameModel.swift
//  Card SET!
//
//  Created by Kiran Shrestha on 12/6/24.
//

import Foundation
import SwiftUICore

struct SetGameModel {
    private(set) var deck: [Card] = []
    
    var selectedCards : [Card] = [] {
        didSet {
            if selectedCards.count == 3 {
                checkSelectedCardsForSet()
            }
            if selectedCards.count > 3 { // we already have 3 cards selected and are trying to select a new one. Reset the current ones and keep the last one only.
                for idx in deck.indices {
                    if oldValue.contains(where: { $0.id == deck[idx].id }) {
                        deck[idx].isSelected = false
                    }
                }
                
                selectedCards = [selectedCards.last!]
            }
        }
    }
    
    init() {
        generateDeck()
    }
    
    func printCurrentDeck() {
        for card in deck {
            print("Card \(card.id): \(card.numberOfShapes) \(card.color) \(card.shape) \(card.shading)")
        }
    }
        
    mutating func shuffle() {
        deck = deck.shuffled()
    }
    
    mutating func generateDeck() {
//        var tempDeck : [Card] = []
//        tempDeck.reserveCapacity(81)
        deck.removeAll(keepingCapacity: true)
        for numberOfShapes in Card.NumberOfShapes.allCases {
            for color in Card.CardColor.allCases {
                for shape in Card.Shape.allCases {
                    for shading in Card.Shading.allCases {
                        deck.append(Card(id: deck.count, numberOfShapes: numberOfShapes, color: color.rawValue, shape: shape, shading: shading))
                    }
                }
            }
        }
        
//        deck = tempDeck
    }

    mutating func selectCard(_ card : Card) {
        
        if let selectedCardIdx = deck.firstIndex(where: {$0.id == card.id}) {
            if deck[selectedCardIdx].isSelected {
                // Card that was tapped is already selected to try to deselect it.
                deck[selectedCardIdx].isSelected = false
                selectedCards = selectedCards.filter{deck[selectedCardIdx].id != $0.id} //remove the "deselected" card from the selection array.
            } else {
                // Card that ws tapped is NOT Selected so mark as Selected.
                deck[selectedCardIdx].isSelected = true
                selectedCards.append(deck[selectedCardIdx])
            }
            print("SelectedCard Array---")
            for card in selectedCards {
                print("\(card.id): \(card.color): \(card.numberOfShapes): \(card.shading)")
            }
            print("CLICK CLICK CLICK")
        }
    }
    
    mutating func checkSelectedCardsForSet() {
        let firstCard = selectedCards[0]
        let secondCard = selectedCards[1]
        let thirdCard = selectedCards[2]
        
        //three selected cards are set via, color OR number of shapes OR shading OR shape
        if (firstCard.color == secondCard.color && firstCard.color == thirdCard.color) ||
            (firstCard.numberOfShapes == secondCard.numberOfShapes && firstCard.numberOfShapes == thirdCard.numberOfShapes) ||
            (firstCard.shading == secondCard.shading && firstCard.shading == thirdCard.shading) ||
            (firstCard.shape == secondCard.shape && firstCard.shape == thirdCard.shape)
        {
            for idx in deck.indices {
                if selectedCards.contains(where: { $0.id == deck[idx].id }) {
                    deck[idx].matched = true
                    //TODO: maybe we deselect the matched cards??? idk.
                }
            }
        }
        else {
            // TODO: Selected cards are NOT SET.
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
