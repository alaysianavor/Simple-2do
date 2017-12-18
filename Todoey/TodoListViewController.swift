//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Mudasir Ahmed on 12/17/17.
//  Copyright © 2017 Mudasir Ahmed. All rights reserved.
//

import UIKit

// is a TableView Controller
class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggs", "Call Johnny", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen", "Twenty"]
    let cellId = "TodoItemCell"

    // load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // how many sections?
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // how many rows in the table?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    

    // cell for item
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    // selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
    
        // if we have a check...say none
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        }
        else {
            cell?.accessoryType = .checkmark
        }
    }
    
    // Add New Items Tapped
    @IBAction func addTapped(_ sender: Any) {
        
        let alertController = UIAlertController.init(title: "Add New Item", message: nil, preferredStyle: .alert)
        
        // reference to the text-field
        var alertTextField = UITextField()
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Placeholder text"
            
            // text-field reference
            alertTextField = textField
        }
        
        alertController.addAction(UIAlertAction.init(title: "Add Item", style: UIAlertActionStyle.default, handler: { (action) in
            self.itemArray.append(alertTextField.text!)
            self.tableView.reloadData()
        }))
        
        // present the alert controller
        self.present(alertController, animated: true, completion: nil)
    }
}
