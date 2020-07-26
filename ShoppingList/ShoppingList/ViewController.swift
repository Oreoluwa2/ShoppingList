//
//  ViewController.swift
//  ShoppingList
//
//  Created by Oreoluwa Omomofe on 7/26/20.
//  Copyright © 2020 One Summer Chicago. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var shoppingTableView: UITableView!
    
    var lists = ["apples", "bananas", "grapes", "oranges"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        shoppingTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = lists[indexPath.row]
        return cell
            
    }
    // Add a new line
    @IBAction func addBtnPressed(_ sender: Any) {
        
        var textfield  = UITextField()
        
        let alert = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add New List", style: .default) { (action) in
            self.lists.append(textfield.text!)
        self.shoppingTableView.reloadData()
        
    }
    
    alert.addTextField { (alertTextField) in
    alertTextField.placeholder = "Add new item"
    textfield = alertTextField
    
    }
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
}
//deletes the rows
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            lists.remove(at: indexPath.item)
            shoppingTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedCell = lists[sourceIndexPath.item]
        lists.remove(at: sourceIndexPath.item)
        lists.insert(movedCell, at: destinationIndexPath.item)
    }
    
    @IBAction func editBtnPressed(_ sender: UIBarButtonItem) {
    self.shoppingTableView.isEditing =
       !self.shoppingTableView.isEditing
        
        sender.title = (self.shoppingTableView.isEditing) ? "Done" : "Edit"
        
        
        
    }
}
