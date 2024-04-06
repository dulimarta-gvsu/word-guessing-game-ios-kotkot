//
//  MainViewViewModel.swift
//  word_guess
//
//  Created by Alec Mirambeau on 3/30/24.
//

import Foundation

class MainViewViewModel{
    var allWords = ["APPLES",
                                   "BANANAS",
                                   "ORANGES", "ROW",
                                   "BOW", "SEW", "RUE",
                                   "DUE", "EAT",
                                   "BEAT", "LEAD",
                                   "FLEW", "DRAW",
                                   "BAWL", "FALL",
                                   "CRAP", "LACK",
                                   "WARN","DARN",
                                   "HIGHS", "DIETS",
                                   "ABOUT", "ALERT",
                                   "ARGUE", "ARRAY",
                                   "CHAIR", "CLOSE",
                                   "CROWD", "CROWN",
                                   "ACCEPT", "CASUAL",
                                   "AROUND", "COUPLE",
                                   "BATTLE", "DEFEND",
                                   "COFFEE", "DESIRE",
                                   "EATING"
    ]
    @Published var correctCounter = 0
    @Published var incorrectCounter = 0
    @Published var normalWord = ""
    @Published var clearWord = ""
    @Published var first = 0
    @Published var tries = 0
    @Published var shuffledWord: Array<Character> = []
    @Published var guessNow = ""
    @Published var noRepeat = ""
    @Published var lower = 3
    @Published var higher = 7
    @Published var errorMessage = ""
    
    var allGuessedWords: Array<wordGuessData> = []
    var beginWordTime: Double = 0.0
    var endWordTime: Double = 0.0
    
    func nowClearWord() {
        clearWord = ""
    }
    
    func addCor() {
        correctCounter += 1
    }
    
    func addInc() {
        incorrectCounter += 1
    }
    
    func addTry() {
        tries += 1
    }
    
    func pickWord() {
        while (normalWord == noRepeat || normalWord.count < lower || normalWord.count > higher){
            normalWord = allWords.randomElement()!
        }
        noRepeat = normalWord
        shuffledWord = Array(normalWord)
        while (String(shuffledWord) == normalWord){
            shuffledWord.shuffle()
        }
        guessNow = String(shuffledWord)
        self.beginWordTime = Date().timeIntervalSince1970
    }
    
    func checkAnswer(guess: String) {
        if (guess.uppercased() == normalWord){
//            word was successfully guessed:
            self.endWordTime = Date().timeIntervalSince1970
            let wordToAdd = wordGuessData(successfullyGuessedOrNot: true, actualWord: self.normalWord, secretWord: generateMaskedWord(guess: self.normalWord), displayActualWord: false)
            // add this guessedWord to our guessed words array
            self.allGuessedWords.append(wordToAdd)
            addCor()
            pickWord()
            nowClearWord()
            tries = 0
            errorMessage = "Good Job! Try this next word"
        } else if (guess.uppercased() != normalWord && tries != 2) {
            addTry()
            errorMessage = "Attempt \(tries) incorrect. Try again"
        } else if (guess.uppercased() != normalWord && tries == 2) {
            // User incorrectly guessed the word too many times.
            // generate the struct and it's data we will put into our guessedWords array.
            self.endWordTime = Date().timeIntervalSince1970
            let wordToAdd = wordGuessData(successfullyGuessedOrNot: false, actualWord: self.normalWord, secretWord: generateMaskedWord(guess: self.normalWord), displayActualWord: false)
            // add this guessedWord to our guessed words array
            self.allGuessedWords.append(wordToAdd)
            addInc()
            pickWord()
            nowClearWord()
            errorMessage = "Too many tries. Time for a new word"
            tries = 0
        }
    }
    
    func generateMaskedWord(guess: String) -> String {
        var maskedWord = ""
        for _ in 0..<guess.count {
            maskedWord += "*"
        }
        return maskedWord
    }

    
}







