//
//  Item.swift
//  PitTrack
//
//  Created by Ilia Kurlovich on 02.08.25.
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
