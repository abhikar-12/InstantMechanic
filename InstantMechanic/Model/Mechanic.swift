//
//  Mechanic.swift
//  InstantMechanic
//
//  Created by Abhishek Kusalkar on 03/09/26.
//

import Foundation

struct Mechanic: Identifiable, Codable {
    let id: Int
    let name: String
    let rating: Double
    let distance: Double
    let location: String
    let isOpen: Bool
    let services: [String]
    let workingHours: String
    let phoneNumber: String
}

