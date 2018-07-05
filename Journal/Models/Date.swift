//
//  Date.swift
//  Journal
//
//  Created by Zachary Frew on 7/4/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import Foundation

extension Date {
    func string(with format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
