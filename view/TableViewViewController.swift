//
//  TableViewViewController.swift
//  word_guess
//
//  Created by Alec Mirambeau on 4/2/24.
//

import UIKit

class TableViewViewController: UIViewController {
    
    private var sortByWordLengthButton: UIButton!
    private var sortByTimeToGuessButton: UIButton!
    private let cities = ["Ada", "Lansing", "allendale", "Grandville"]
    private var myTab: UITableView!
    var allWordsGuessed: Array<wordGuessData>?
    private var previousIndexTapped: Int = 0
    private var numWordsUnhidden: Int = 0
    private var vm: tableViewViewModel?
    
    init(wordsPassed: Array<wordGuessData>){
        super.init(nibName: nil, bundle: nil)
        self.vm = tableViewViewModel(words: wordsPassed)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.myTab = self.view.viewWithTag(23) as? UITableView
        
        self.myTab.register(UINib(nibName: "cellForTableViewTableViewCell", bundle: nil), forCellReuseIdentifier: "wordInfo")
        //
        self.myTab.dataSource = self
        self.myTab.delegate = self
        self.sortByWordLengthButton = view.viewWithTag(2) as? UIButton
        self.sortByWordLengthButton.addTarget(self, action: #selector(sortByWordLength), for: UIControl.Event.touchUpInside)
        
        self.sortByTimeToGuessButton = view.viewWithTag(1) as? UIButton
        self.sortByTimeToGuessButton.addTarget(self, action: #selector(sortByTimeToGuessWord), for: UIControl.Event.touchUpInside)
        
        
        
//        checkButton.addTarget(self, action: #selector(checkMyAnswer), for: UIControl.Event.touchUpInside)

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let currentCell = self.vm?.allWordsGuessed![indexPath.row]
        // if the user correctly guessed the word, make the cell color green
        if ((currentCell!.successfullyGuessedOrNot)){
            cell.backgroundColor = UIColor.green
        } else {
            cell.backgroundColor = UIColor.red
            
        }
    }
    
    @objc func sortByWordLength(){
        vm?.sortByWordLength()
        // how do we notify the table that the data set has been changed (sorted into a different order)
        self.myTab.reloadData()
    }
    
    @objc func sortByTimeToGuessWord(){
        self.vm?.sortByTimeToGuess()
        self.myTab.reloadData()
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

extension TableViewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // since we require user to have guessed at least 1 word for the view scoreboard button to
        // work we can just force unwrap allWordsGuessed variable. We know it won't be nil.
        return (self.vm?.allWordsGuessed!.count)!
//        return cities.count
    }
    
    /**
     Next steps are to change texts of the TableViewUI using the functions below
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var textForTextBox: String
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordInfo", for: indexPath)
        let whichOne = self.vm!.allWordsGuessed![indexPath.row]
        // if the user selected this box then displayActualWord should be true so we will want this cell to displa the actual word
        if whichOne.displayActualWord{
            textForTextBox = whichOne.actualWord
        }
        else{
            // else user didn't click on this one so we should instead display the masked word.
            textForTextBox = whichOne.maskedWord
        }
        cell.textLabel?.text = whichOne.scrambledWord + " " + textForTextBox
        // if you want to change the detail label you would do
        // After changing the layout so a detailed text is there.
        // Check IOS TableView from professors Github
        cell.detailTextLabel?.text = "\(whichOne.timeToGuessWord) seconds"
        return cell
    }
    
    
}

// to implement on click listener
extension TableViewViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) was clicked")
        let selectedRow = indexPath.row
        if numWordsUnhidden == 0{
            numWordsUnhidden += 1
            self.vm?.allWordsGuessed![selectedRow].displayActualWord = true
        } else {
            if selectedRow == previousIndexTapped{
                numWordsUnhidden -= 1
                self.vm?.allWordsGuessed![selectedRow].displayActualWord = false
            } else{
                // below assumes we are tapping on a different word than previosuly tapped so the numWordsUnhidden
                // won't change because we are hiding 1 word and revealing 1 word.
                self.vm?.allWordsGuessed![previousIndexTapped].displayActualWord = false
                self.vm?.allWordsGuessed![selectedRow].displayActualWord = true
            }
        }
        self.previousIndexTapped = indexPath.row
        tableView.reloadData()
//        tableView.reloadData() is same as .notifyDataSetChanged() in Kotlin
    }
    
    
}
