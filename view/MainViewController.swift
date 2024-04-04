//
//  MainViewController.swift
//  word_guess
//
//  Created by Hans Dulimarta on 3/21/24.
//

import UIKit
import SnackBar
import Combine

class MainViewController: UIViewController {
    
    var correctScore: UILabel!
    var incorrectScore: UILabel!
    var checkButton: UIButton!
    var scrambledWordText: UILabel!
    var userInputTextField: UITextField!
    
    let VM = MainViewViewModel()
    var pool: Set<AnyCancellable> = []

    override func viewDidLoad() {
        if (VM.first == 0) {
            VM.pickWord()
            VM.first = 1
        }
        super.viewDidLoad()
        // Change the background color to your preference
        self.view.backgroundColor = .orange
        /*
         Declare widgets
         */
        // correctCount Text
        correctScore = view.viewWithTag(10) as? UILabel
                
        // incorrect Score text
        incorrectScore = view.viewWithTag(11) as? UILabel
        
        // Scrambled Word Text
        scrambledWordText = view.viewWithTag(20) as? UILabel
        
        // userInput Text
        userInputTextField = view.viewWithTag(30) as? UITextField
        
        // check user input button
        checkButton = view.viewWithTag(40) as? UIButton
        
        checkButton.addTarget(self, action: #selector(checkMyAnswer), for: UIControl.Event.touchUpInside)

        // settings button
        let settingsButton = view.viewWithTag(41) as? UIButton
        settingsButton?.addTarget(self, action: #selector(toSettings), for: UIControl.Event.touchUpInside)
        
        /*
         Need to create function to make settings button work and the associated variables for data transfer for settings screen to work properly.
         */
        // Do any additional setup after loading the view.
        
        
        VM.$correctCounter
            .receive(on: DispatchQueue.main)
            .sink { val in
                self.correctScore.text = "Correct: \(val)"}
            .store(in: &pool)
        
        VM.$incorrectCounter
            .receive(on: DispatchQueue.main)
            .sink { val in
                self.incorrectScore.text = "Incorrect: \(val)"}
            .store(in: &pool)
        
        VM.$guessNow
            .receive(on: DispatchQueue.main)
            .sink { val in
                self.scrambledWordText.text = val}
            .store(in: &pool)
        
        VM.$clearWord
            .receive(on: DispatchQueue.main)
            .sink { val in
                self.userInputTextField.text = val}
            .store(in: &pool)
        
    }
    
    @objc func checkMyAnswer(){
        VM.checkAnswer(guess: userInputTextField.text!)
        SnackBar.make(in: self.view, message: VM.errorMessage, duration: .lengthShort).show()
    }
    
    // setup function to be called when someone presses the settings
    // button.
    @objc func toSettings(){
        // initialize the struct we will pass to settings ViewControl
        // (Activity)
        let dataToPass = settingsArg(minLength: VM.lower, maxLength: VM.higher)
        
        let settingsIntantiation = settingsViewController(arg: dataToPass)
        // setup the receiving function to call before transitioning to
        // settings screen
        settingsIntantiation.functionToUpdateMainGamesData = fromSettings
        // now launch the activity (push the view controller onto the
        // view controller stack.
        self.navigationController?.pushViewController(settingsIntantiation, animated: true)
    }
    
    func fromSettings(passedData: settingsArg){
        // if the user changed the minimum word size variable value or maximum word size value then we should pick a new word to reflect that
        if (self.VM.lower != passedData.minLength) || (self.VM.higher != passedData.maxLength){
            self.VM.lower = passedData.minLength
            self.VM.higher = passedData.maxLength
            self.VM.pickWord()
            self.VM.nowClearWord()
        }
    }
        // else if neither bound was changed than the previous used word
        // should still be valid and work.
        
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
