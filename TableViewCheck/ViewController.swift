//
//  ViewController.swift
//  TableViewCheck
//
//  Created by MAC on 04/03/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit

class MyTableViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    
    var filteredData: [String]!

    var tableData:[String] = [
    "Abia",
    "Adamawa",
    "Akwa Ibom",
    "Anambra",
    "Bauchi",
    "Bayelsa",
    "Benue",
    "Borno",
    "Cross River",
    "Delta",
    "Ebonyi",
    "Edo",
    "Ekiti",
    "Enugu",
    "Gombe",
    "Imo",
    "Jigawa",
    "Kaduna",
    "Kano",
    "Katsina",
    "Kebbi",
    "Kogi",
    "Kwara",
    "Lagos",
    "Nasarawa",
    "Niger",
    "Ogun",
    "Ondo",
    "Osun",
    "Oyo",
    "Plateau",
    "Rivers",
    "Sokoto",
    "Taraba",
    "Yobe",
    "Zamfara"]
    
    
    @IBOutlet var myTableCell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableCell.delegate = self
        myTableCell.dataSource = self
        searchBar.delegate = self
        filteredData = tableData
    }


}

extension MyTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredData.count
        
        // used filteredData insted of tableData bc u might have filtered data and it might nto be complete data infaact if u dont use filteredData, the search button will not be triggered or work
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dcell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! MytableCell
        dcell.textLabel?.text = filteredData[indexPath.row]
        
        //filteredData instead of tableData
        return dcell
    }
    
    
}

extension MyTableViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchTxt: String) {
        filteredData = []
        
        if searchTxt == "" {
            filteredData = tableData
            
        } else {
    
    for state in tableData {
    if state.lowercased().contains(searchTxt.lowercased()) {
    
    filteredData.append(state)
    }
    
    }
        }
    
        self.myTableCell.reloadData()
    }



}


