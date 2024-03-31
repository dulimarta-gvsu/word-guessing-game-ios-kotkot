//
//  MainViewController.swift
//  word_guess
//
//  Created by Hans Dulimarta on 3/21/24.
//

import UIKit
import SnackBar

class MainViewController: UIViewController {
    
    var correctScore: UILabel!
    var incorrectScore: UILabel!
    var checkButton: UIButton!
    
    let VM = MainViewViewModel()

    override func viewDidLoad() {
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
        var scrambledWordText = view.viewWithTag(20) as? UILabel
        
        // userInput Text
        var userInputTextField = view.viewWithTag(30) as? UITextField
        
        // check user input button
        checkButton = view.viewWithTag(40) as? UIButton
        
        checkButton.addTarget(self, action: #selector(doSome), for: UIControl.Event.touchUpInside)

        // settings button
        var settingsButton = view.viewWithTag(41) as? UIButton
        
        /*
         Need to create function to make settings button work and the associated variables for data transfer for settings screen to work properly.
         */
        // Do any additional setup after loading the view.
    }
    
    @objc func doSome(){
        correctScore.text = "You got it"
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
