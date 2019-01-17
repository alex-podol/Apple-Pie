//
//  ViewController.swift
//  Apple Pie
//
//  Created by Alexander on 1/16/19.
//  Copyright © 2019 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //  list of word угадывания
    var listOfWords = ["арбуз","банан","вертолет","гномик","домик","сад","вишня","телега","чай","лимон"]
    
    //  количество неверных попыток
    let incorrectMovesAllowed = 7
    
    // количество выигрышей и проигрышей
    var totalWins  = 0
    var totalLosses = 0
    
    var currentGame: Game! // текущая игра
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // запуск нового раунда игры
        newRound()
        
    }
    
    // запуск нового раунда игры
    func newRound() {
        let newWord = listOfWords.removeFirst()
        
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed,
                           guessedLetters: [])
        
        updateUI()
    }
        
    // обновление интерфейса
    func updateUI() {
        // обновляем картинку
        let imageName = "Tree \(currentGame.incorrectMovesRemaining)"
        treeImageView.image = UIImage(named: imageName)
        
        // обновляем угадываемое слово
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpaces = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpaces
        
        
        // обновляем счет
        scoreLabel.text = "Выигрыши: \(totalWins), проигрыши: \(totalLosses)"
    }
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        
        currentGame.playerGuessed(letter: letter)
        print("\(currentGame.word) \(letter)")
        
        updateUI()
    }
    

}


