import UIKit

//Table view controller
class TodoListViewController: UITableViewController {
    
    var itemArray = ["Simple To Do List", "Made by Alaysia & Yong", "AP CSP 2018-2019"]
    let ToDoCell = "TodoItemCell"

//load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//section selection
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//table row selection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    

//item cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToDoCell, for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
//selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
    
//checkmarks
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        }
        else {
            cell?.accessoryType = .checkmark
        }
    }
    
//add
    @IBAction func addTapped(_ sender: Any) {
        
        let alertController = UIAlertController.init(title: "Add New Item", message: nil, preferredStyle: .alert)
        
//references text field
        var alertTextField = UITextField()
        
        alertController.addTextField { (textField) in
            textField.placeholder = "t e x t UwU"
            
//references text field
            alertTextField = textField
        }
        alertController.addAction(UIAlertAction.init(title: "Add Item", style: UIAlertAction.Style.default, handler: { (action) in
            self.itemArray.append(alertTextField.text!)
            self.tableView.reloadData()
        }))
        
//presentation
        self.present(alertController, animated: true, completion: nil)
    }
}
