//
//  ViewController.swift
//  ApplePie
//
//  Created by Bheki Maenetja on 2020/08/01.
//  Copyright © 2020 Bonanza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var treeImage: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    var currentGame: Game!
    
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func newRound() {
        let newWord = listOfWords.randomElement()!
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        enableLetterButtons(true)
        updateUI()
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        correctWordLabel.text = letters.joined(separator: " ")
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImage.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    func updateGameState() {
      if currentGame.incorrectMovesRemaining == 0 {
        totalLosses += 1
      } else if currentGame.word == currentGame.formattedWord {
        totalWins += 1
      } else {
        updateUI()
      }
    }
    
    func enableLetterButtons(_ enable: Bool) {
      for button in letterButtons {
        button.isEnabled = enable
      }
    }
}

