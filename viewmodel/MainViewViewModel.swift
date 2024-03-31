//
//  MainViewViewModel.swift
//  word_guess
//
//  Created by Alec Mirambeau on 3/30/24.
//

import Foundation

class MainViewViewModel{
    var allWords = ["apples",
                                   "bananas",
                                   "oranges", "row",
                                   "bow", "sew", "rue",
                                   "due", "eat",
                                   "beat", "lead",
                                   "flew", "draw",
                                   "bawl", "fall",
                                   "crap", "lack",
                                   "warn","darn",
                                   "highs", "diets",
                                   "about", "alert",
                                   "argue", "array",
                                   "chair", "close",
                                                "crowd", "crown",
                                                "accept", "casual",
                                                "around", "couple",
                                                "battle", "defend",
                                                "coffee", "desire",
                                                "eating"
    ]
    @Published var correctCounter = 0
    @Published var incorrectCounter = 0
    @Published var normalWord = ""
    @Published var clearWord = ""
    @Published var first = 0
    @Published var tries = 0
    @Published var shuffledWord: Array<Character>
    @Published var guessNow = ""
    @Published var noRepeat = ""
    @Published var lower = 0
    @Published var higher = 0
    @Published var errorMessage = ""
    
    func addCor() {
        correctCounter += 1
    }
    
    func addInc() {
        incorrectCounter += 1
    }
    
}
