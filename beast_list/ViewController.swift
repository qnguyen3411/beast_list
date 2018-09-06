//
//  ViewController.swift
//  beast_list
//
//  Created by Quang Nguyen on 9/6/18.
//  Copyright © 2018 Quang Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]

  @IBOutlet weak var taskTextField: UITextField!
  @IBOutlet weak var tableView: UITableView!
  @IBAction func beastButtonPressed(_ sender: UIButton) {
    if let newTask = taskTextField.text {
      tasks.append(newTask)
      taskTextField.text = ""
    }
    tableView.reloadData()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    // Data that goes to the table view comes from self(the view controller)
    tableView.dataSource = self
  }
}


extension ViewController: UITableViewDataSource {
  // Tells the data source to return the number of rows in a given section of a table view.
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // return an integer that indicates how many rows (cells) to draw
    return tasks.count
    
  }
  
//  Asks the data source for a cell to insert in a particular location of the table view.
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   // Get the UITableViewCell and create/populate it with data then return it
    let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
    cell.textLabel?.text = "\(tasks[indexPath.row])"
    return cell
  }
  
}
