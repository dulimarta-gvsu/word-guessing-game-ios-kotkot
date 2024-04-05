//
//  TableViewViewController.swift
//  word_guess
//
//  Created by Alec Mirambeau on 4/2/24.
//

import UIKit

class TableViewViewController: UIViewController {
    
    private let cities = ["Ada", "Lansing", "allendale", "Grandville"]
    private var myTab: UITableView!
    var passedData: Array<wordGuessData>?
    
    init(words: Array<wordGuessData>){
        super.init(nibName: nil, bundle: nil)
        self.passedData = words
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.myTab = self.view.viewWithTag(23) as? UITableView
        
        self.myTab.register(UINib(nibName: "cellForTableViewTableViewCell", bundle: nil), forCellReuseIdentifier: "cat")
        //
        self.myTab.dataSource = self
        self.myTab.delegate = self
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
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cat", for: indexPath)
        let whichOne = self.cities[indexPath.row]
        cell.textLabel?.text = "this is a test, city: \(whichOne)"
        // if you want to change the detail label you would do
        // After changing the layout so a detailed text is there.
        // Check IOS TableView from professors Github
        cell.detailTextLabel?.text = "Changing the detail label \(indexPath.row)"
        return cell
    }
    
    
}

// to implement on click listener
extension TableViewViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) was clicked")
//        tableView.reloadData() is same as .notifyDataSetChanged() in Kotlin
    }
    
}
