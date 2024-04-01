//
//  settingsViewController.swift
//  word_guess
//
//  Created by Alec Mirambeau on 3/31/24.
//

import UIKit
import SnackBar

class settingsViewController: UIViewController {
    let vm = settingsViewModel()
    var passedData: settingsArg?
    var functionToUpdateMainGamesData: ((settingsArg) -> Void)?
    var minimumWordSizeTB: UITextField!
    var maximumWordSizeTB: UITextField!

    
    init(arg: settingsArg){
        super.init(nibName: nil, bundle: nil)
        vm.initializeData(minVal: arg.minLength, maxVal: arg.maxLength)
        self.passedData = arg
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        
        // setup minimum word size tb
        minimumWordSizeTB = view.viewWithTag(20) as? UITextField
        minimumWordSizeTB?.text = "\(String(describing: self.passedData?.minLength))"
        
        // setup maximum word size tb
        maximumWordSizeTB = view.viewWithTag(40) as? UITextField
        maximumWordSizeTB?.text = "\(String(describing: self.passedData?.maxLength))"
        
        // setup observers
        vm.snackMessage.observe {_ in
            if self.vm.snackMessage.value?.count != 0{
                SnackBar.make(in: self.view,
                              message: self.vm.snackMessage.value ?? "ensure you entered word sizes from 3 - 7",
                              duration: .lengthLong)
                .show()
            }
        }

        // update the textboxes to initially show the current passed in
        // min and max word length
        if let minLengthValueSize = self.passedData?.minLength{
            self.minimumWordSizeTB.text = String(minLengthValueSize)

        }
        if let maxLengthValueSize = self.passedData?.maxLength{
            self.maximumWordSizeTB.text = String(maxLengthValueSize)
        }

        
        // setup return to game
        let returnToGameButton = view.viewWithTag(50)
        
        // create return to game function
        func returnToGame(){
            if var minLengthValueSize = self.minimumWordSizeTB.text{
                var intMinLengthValueSize:Int? = Int(minLengthValueSize)
                
                if var maxLengthValueSize = self.maximumWordSizeTB.text{
                    var intMaxLengthValueSize: Int? = Int(maxLengthValueSize)
                    
                    let toGameData = settingsArg(minLength: intMinLengthValueSize!, maxLength: intMaxLengthValueSize!)
                }
            }
        }
        
//        if let text = textField.text {
//            // text is a non-optional string here
//            print(text)
//        } else {
//            // Handle the case where the text field is empty
//            print("Text field is empty")
//        }

        
        

        // Do any additional setup after loading the view.
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
