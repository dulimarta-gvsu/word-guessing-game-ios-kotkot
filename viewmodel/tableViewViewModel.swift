//
//  tableViewViewModel.swift
//  word_guess
//
//  Created by Alec Mirambeau on 4/8/24.
//

import Foundation

class tableViewViewModel{
    var allWordsGuessed: Array<wordGuessData>?
    init(words: Array<wordGuessData>){
        self.allWordsGuessed = words
    }
    
    func sortByWordLength(){
        self.allWordsGuessed = self.allWordsGuessed?.sorted(by: {$0.actualWord.count < $1.actualWord.count})
    }
    
    func sortByTimeToGuess(){
        self.allWordsGuessed = self.allWordsGuessed?.sorted(by: {$0.timeToGuessWord < $1.timeToGuessWord})
    }
    
}
