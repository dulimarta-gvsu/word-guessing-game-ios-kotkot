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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.myTab = self.view.viewWithTag(23) as? UITableView
        
        self.myTab.register(UINib(nibName: "cellForTableViewTableViewCell", bundle: nil), forCellReuseIdentifier: "cat")
        self.myTab.dataSource = self
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
        return cell
    }
    
    
}
