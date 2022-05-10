//
//  GeographyModel.swift
//  Memorize
//
//  Created by CS193p Instructor on 4/5/21.
//  Overall model

import Foundation

struct GeographyModel<CardContent> {
    private(set) var cards: [Card]
    private(set) var score = 0
    private let featuresDictionary: [String:[String]] = ["rivers": ["nile", "volga", "ohio"]]
    
    private(set) var currentFeature: String
    
    
    struct Card {
        let content: CardContent
    }
    
    mutating func choose(isCorrect: Bool) {
        if isCorrect {
            score+=1
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func updateScore(_ additor: Int?) {
        if let i = additor {
            score = i
        }
        else {
            score = score + 1
        }
    }
    
    init(featureName: String, createCardContent: (String) -> CardContent /*numberOfChoices: String*/) {
        self.currentFeature = featureName
        cards = []
        let items: [String] = featuresDictionary[featureName, default:["unknown"]]
            for item in items {
                let content = createCardContent(item)
                
                // allow all the cards to have a unique identifier
                cards.append(Card(content: content))
            }
            // shuffle the cards
            cards.shuffle()
            // set the score to 0
            score = 0
        }
}
    
    //TODO: Add to QuizView
    /**/
    
        

