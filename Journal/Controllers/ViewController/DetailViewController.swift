//
//  DetailViewController.swift
//  Journal
//
//  Created by Zachary Frew on 7/4/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let entry = entry {
            titleTF.text = entry.title
            bodyTextTF.text = entry.bodyText
        }
    }

    var entry: Entry?
    
    // MARK: - Outlets
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var bodyTextTF: UITextField!
    
    // MARK: - Actions
    
    @IBAction func updateEntry(_ sender: UIButton) {
        guard let title = titleTF.text, let bodyText = bodyTextTF.text, let entry = entry else { return }
        
        EntryController.update(entry: entry, newTitle: title, newBodyText: bodyText)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
