//
//  ViewController.swift
//  Todoey
//
//  Created by Vincent Koh on 1/2/19.
//  Copyright © 2019 Vincent Koh. All rights reserved.
//

import UIKit

//class ViewController: UIViewController {
//class ViewController : UITableViewController {
class ToDoListViewController : UITableViewController {
    
 /* to be deleted
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
*/
 
        //let itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon", "Shopping"]
    
     var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon", "Shopping"]
        // change this itemArray from immutable(constant) to mutable as we want to append items to it.
    
    
 //Mark - TableView Datasource Method
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for:indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
   
    
    //Mark -  TableView Delegate Method
    
    //Objective - to select the row, to place a checkmark on the selected row.
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // says that when the row is selected and if its checkmarked then unchecked it.
        
        //print(itemArray[indexPath.row])// print out the name of the items selected.
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
    //background color of row selected changes and return to background color
        tableView.deselectRow(at: indexPath, animated: true)
      
    }
    
    //Mark -  Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // design a popup msg box whereby name of the new item is inputed and appeneded to the arrayItem
        
        var textField = UITextField()
            // this var is created to capture the input of the alert.TextField becuase the "input
            // is restricted within the limits of the alertTextField closure and cannot be asccesible outside it.
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
       let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what happens when the user clicks the "Add Item" button on our UI Alert.
           // print("success")
        
            //print(textField.text)
        
            self.itemArray.append(textField.text!)
            // the "!" says that even if the textField is empty - its still be a blank.
        
            self.tableView.reloadData()
        
        
        
        }
       // alert.addAction(action)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            //print(alertTextField.text)
            textField = alertTextField
            
        }
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}

