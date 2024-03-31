//
//  settingsViewModel.swift
//  word_guess
//
//  Created by Alec Mirambeau on 3/31/24.
//

import Foundation

class settingsViewModel{
    var minValue = 3
    var maxValue = 7
    let snackMessage = LiveData("")
    
    func isValidMinLength(minVal: Int) -> Bool{
        var validMinLength = (self.minValue <= minVal) && (minVal <= self.maxValue)
        if !validMinLength{
            snackMessage.value = "Minimum length must be between 1 - 7"
        }
        return validMinLength
    }
    
    func isValidMaxLength(maxVal: Int) -> Bool{
        var validMaxLength = (self.minValue <= maxVal) && (maxVal <= self.maxValue)
        if !validMaxLength{
            snackMessage.value = "Maximum length must be between 1 - 7"
        }
        return validMaxLength
    }
    
    func initializeData(minVal: Int, maxVal: Int){
        self.minValue = minVal
        self.maxValue = maxVal
    }
    
    
    
}
