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
        let minimumWordSizeTB = view.viewWithTag(20) as? UITextField
        minimumWordSizeTB?.text = "\(String(describing: self.passedData?.minLength))"
        
        // setup maximum word size tb
        let maximumWordSizeTB = view.viewWithTag(40) as? UITextField
        maximumWordSizeTB?.text = "\(String(describing: self.passedData?.maxLength))"
        
        // setup observers
        vm.snackMessage.observe {_ in 
            SnackBar.make(in: self.view,
                          message: self.vm.snackMessage.value ?? "ensure you entered word sizes from 3 - 7",
                          duration: .lengthLong)
            .show()
        }

        
        // setup return to game
        let returnToGame = view.viewWithTag(50)
        
        
        
        
        

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
