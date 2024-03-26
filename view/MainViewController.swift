//
//  MainViewController.swift
//  word_guess
//
//  Created by Hans Dulimarta on 3/21/24.
//

import UIKit

class MainViewController: UIViewController {
    
    var correctCount: UILabel!
    var checkButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Change the background color to your preference
        self.view.backgroundColor = .lightGray
        correctCount = view.viewWithTag(21) as? UILabel
        checkButton = view.viewWithTag(51) as? UIButton
        
        checkButton.addTarget(self, action: #selector(doSome), for: UIControl.Event.touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    @objc func doSome(){
        correctCount.text = "You got it"
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
