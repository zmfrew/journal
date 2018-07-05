//
//  EntryController.swift
//  Journal
//
//  Created by Zachary Frew on 7/4/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import Foundation

class EntryController {
    
    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    static func addEntriesWith(title: String, bodyText: String) {
        
        let newEntry = Entry(title: title, bodyText: bodyText)
        EntryController.shared.entries.append(newEntry)
    }
    
    static func remove(entry: Entry) {
        
        guard let indexOfEntry = EntryController.shared.entries.index(of: entry) else { return }
        
        EntryController.shared.entries.remove(at: indexOfEntry)
    }
    
    static func update(entry: Entry, newTitle: String, newBodyText: String) {
        entry.title = newTitle
        entry.bodyText = newBodyText
    }
    
}
