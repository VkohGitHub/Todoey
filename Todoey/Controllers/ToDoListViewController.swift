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
    
    // var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon", "Shopping"]
        // change this itemArray from immutable(constant) to mutable as we want to append items to it.
    
        var itemArray = [Item]() // an array of item objects (as opposed to array of Strings earlier
    
    
    
    //User Default
    
        let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item() // item class
        newItem.title = "Find Mike"
        //Lect 245 - delete
            //newItem.done =  true
        itemArray.append(newItem)
       
        let newItem2 = Item() // item class
        newItem2.title = "Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item() // item class
        newItem3.title = "Destroy Demogorgon"
        itemArray.append(newItem3)
    
    //Mark VK_1 - Retrieve the data from User Default to the table view.
      /*
       if let  items = defaults.array(forKey: "ToDoListArray") as? [String]{
           itemArray = items
      }
      */
        
     //Lect 245 - 01 - Reactivate this code.
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
            itemArray = items
        }
        
    }
    
    
 //Mark - TableView Datasource Method
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for:indexPath)
        
        
        //Lect 243-02
            let item = itemArray[indexPath.row] //the item we are currently trying to set up for the cell
        
        //cell.textLabel?.text = itemArray[indexPath.row]
        // Lect 243
            cell.textLabel?.text = item.title
        
    //Lect 243 - 10
        //if itemArray[indexPath.row].done == true {//short cut becuase of Lect 243-02
        
    /* Lect 244 - delete the lines. replace with Lect 244-01
         
        if item.done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
   */
        
    //Lect 244 - 01 - The Ternary Operator
        //cell.accessoryType = item.done == true ? .checkmark : .none
         cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
   
    //Mark -  TableView Delegate Method
    
    //Objective - to select the row, to place a checkmark on the selected row.
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // says that when the row is selected and if its checkmarked then unchecked it.
        
        //print(itemArray[indexPath.row])// print out the name of the items selected.
        
        //Lect  243
        
        //refactor ;
            itemArray[indexPath.row].done = !itemArray[indexPath.row].done
       /*
        if itemArray[indexPath.row].done == false {
            itemArray[indexPath.row].done = true
        }   else {
            itemArray[indexPath.row].done = false
        }
        */
        
    /* Lect 243 - after inputing Lect 243 - 10 - delete these linees.
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    */
        
        // Lect 243
            tableView.reloadData()
        
    //background color of row selected changes and return to background color
        tableView.deselectRow(at: indexPath, animated: true)
      
    }
    
    //Mark -  Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // design a popup msg box whereby name of the new item is inputed and appeneded to the arrayItem
        
        var textField = UITextField()
           /*  this var is created to capture the input of the alert.TextField becuase the "input
             is restricted within the limits of the alertTextField closure and cannot be asccesible outside it.
        */
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
       let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what happens when the user clicks the "Add Item" button on our UI Alert.
           // print("success")
        
            let newItem = Item()
            newItem.title = textField.text!
        
            //self.itemArray.append(textField.text!)
            // the "!" says that even if the textField is empty - its still be a blank.
        
            self.itemArray.append(newItem)
        
        
            self.defaults.setValue(self.itemArray, forKey: "ToDoListArray")
            // ie save the item under user default under the plist name "ToDoListArray"
            // next display the data onto the tableView (see Mark - VK_1
        
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

