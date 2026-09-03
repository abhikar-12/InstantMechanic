//
//  ServiceRequest.swift
//  InstantMechanic
//
//  Created by Abhishek Kusalkar on 03/09/26.
//

import Foundation

struct ServiceRequest: Identifiable {
    let id = UUID()
    let serviceType: String
    let vehicleNumber: String
    let location: String
    let problemDescription: String
}
