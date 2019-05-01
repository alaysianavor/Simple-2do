//
//  Main.swift
//  Simple2Do
//
//  Created by Alaysia & Yong on 04/01/19.
//  Copyright © 2019 Yong & Alaysia. All rights reserved.
//

//necessary imports
import UIKit
import Foundation

//Table view controller class establishment
class TodoListViewController: UITableViewController {
    
    var ToDoArray = ["Simple To Do List", "Made by APCSP Students", "AP CSP 2018-2019"]
    let ToDoCell = "TodoItemCell"

//load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//selection
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        _ = tableView.cellForRow(at: indexPath)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoArray.count
    }
    

    
    
//cell identifier
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToDoCell, for: indexPath)
        cell.textLabel?.text = ToDoArray[indexPath.row]
       // randomizes the colors of each row
        let redRandom = CGFloat(drand48())
        let greenRandom = CGFloat(drand48())
        let blueRandom = CGFloat(drand48())
        cell.backgroundColor = UIColor(red: redRandom, green: greenRandom, blue: blueRandom, alpha: 1.0)
       // rounds the rectangle corners
        cell.layer.cornerRadius = 25
        cell.layer.masksToBounds = true
        return cell
    }
    
//delete by sliding
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.ToDoArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
//add button
    @IBAction func AddItem(_ sender: Any) {
        
        let alertController = UIAlertController.init(title: "New Task", message: nil, preferredStyle: .alert)
        var alertTextField = UITextField()
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Task"
            alertTextField = textField
        }
        let CancelTask = UIAlertAction(title: "Cancel", style: .cancel){(action:UIAlertAction)in
            print("task addition canceled");
        }
        alertController.addAction(CancelTask)
        let AddTask = UIAlertAction(title: "Add", style: .default){(action:UIAlertAction)in
            self.ToDoArray.append(alertTextField.text!)
            self.tableView.reloadData()
            print("task added");
        }
        alertController.addAction(AddTask)
        self.present(alertController, animated: true, completion: nil)
    }
    
//info button
    @IBAction func infoButton(_ sender: Any) {
        let alertController = UIAlertController.init(title: "Amount of Items to be Completed:", message: "\(ToDoArray.count)", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel){(action:UIAlertAction)in
            print("OK");
        }
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
        }
    
}
