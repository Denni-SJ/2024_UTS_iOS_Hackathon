//
//  Item.swift
//  Apple Intelligence Recipe Generator
//
//  Created by Rod Datham on 20/6/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
