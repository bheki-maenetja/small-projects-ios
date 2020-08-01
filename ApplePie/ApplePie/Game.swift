//
//  Game.swift
//  ApplePie
//
//  Created by Bheki Maenetja on 2020/08/01.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    var formattedWord: String {
        var guessedWord = ""
        
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            if incorrectMovesRemaining > 0 {
                incorrectMovesRemaining -= 1
            }
        }
    }
}
