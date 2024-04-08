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
    
}
