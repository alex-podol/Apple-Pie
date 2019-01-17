//
//  Game.swift
//  Apple Pie
//
//  Created by Alexander on 1/16/19.
//  Copyright © 2019 Alexander. All rights reserved.
//

import Foundation



struct Game {
    
    var word: String // угадываемое слово
    var incorrectMovesRemaining: Int // количество оставшихся попыток
    
    //  список нажатых букв
    var guessedLetters: [Character]
    
    // обработка нажатой кнопки
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        
        // проверяем - содержится ли буква в слове
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    
    
    
    
    
    
}
