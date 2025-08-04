//
//  Item.swift
//  PitTrack
//
//  Created by Ilia Kurlovich on 02.08.25.
//

import Foundation
import SwiftData
import UIKit

@Model
final class Car {
    var name: String
    var year: Int
    var vin: String
    var plateNumber: String
    var imagePath: String?
    var events: [Event] = []

    init(name: String, year: Int, vin: String, plateNumber: String, imagePath: String? = nil) {
        self.name = name
        self.year = year
        self.vin = vin
        self.plateNumber = plateNumber
        self.imagePath = imagePath
    }

    var image: UIImage {
        if let loaded = ImageStorageService.shared.loadImage(from: imagePath) {
            return loaded
        } else {
            return UIImage(named: "defaultCar") ?? UIImage()
        }
    }
}
