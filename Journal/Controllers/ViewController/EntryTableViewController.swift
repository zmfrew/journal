//
//  EntryTableViewController.swift
//  Journal
//
//  Created by Zachary Frew on 7/4/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

class EntryTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: Outlets
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var bodyTextTF: UITextField!
    
    // MARK: Actions
    @IBAction func addEntry(_ sender: UIBarButtonItem) {
        guard let title = titleTF.text, !title.isEmpty, title != " ", let bodyText = bodyTextTF.text, !bodyText.isEmpty, bodyText != " " else {
            titleTF.text = ""
            bodyTextTF.text = ""
            return
        }
        
        EntryController.addEntriesWith(title: title, bodyText: bodyText)
        
        titleTF.text = ""
        bodyTextTF.text = ""
        
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        let entryCell = EntryController.shared.entries[indexPath.row]

        cell.textLabel?.text = entryCell.title
        
        cell.detailTextLabel?.text = entryCell.timestamp.string(with: "MMM dd, yyy")
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entryToDelete = EntryController.shared.entries[indexPath.row]
            EntryController.remove(entry: entryToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // MARK: - Navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let destinationVC = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
        
            let selectedEntry = EntryController.shared.entries[indexPath.row]
            destinationVC.entry = selectedEntry
            
        }
     }
    
}
