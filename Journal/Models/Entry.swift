//
//  Entry.swift
//  Journal
//
//  Created by Zachary Frew on 7/4/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import Foundation

// Create a Unit test that verifies NSCoding functionality by converting an instance to and from NSData.
class Entry: Equatable, NSCoding {
   
    let timestamp: Date
    // Title and bodyText are var due to edit capability.
    var title: String
    var bodyText: String
    
    init(title: String, bodyText: String) {
        self.timestamp = Date()
        self.title = title
        self.bodyText = bodyText
    }
    
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.timestamp == rhs.timestamp && lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(timestamp)
        aCoder.encode(title)
        aCoder.encode(bodyText)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObject() as? String,
            let bodyText = aDecoder.decodeObject() as? String,
            let timestamp = aDecoder.decodeObject() as? Date else { return nil }
        
        self.init(title: title, bodyText: bodyText)
    }
    
}
