//necessary imports
import UIKit
import Foundation

//Table view controller class establishment
class TodoListViewController: UITableViewController {
    
    var ToDoArray = ["Simple To Do List", "Made by Alaysia & Yong", "AP CSP 2018-2019"]
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
        let CancelTask = UIAlertAction(title: "Cancel", style: .cancel){(action:UIAlertAction!)in}
        alertController.addAction(CancelTask)
        let AddTask = UIAlertAction(title: "Add", style: .default){(action:UIAlertAction)in
            self.ToDoArray.append(alertTextField.text!)
            self.tableView.reloadData()
        }
        alertController.addAction(AddTask)
        self.present(alertController, animated: true, completion: nil)
    }
}
