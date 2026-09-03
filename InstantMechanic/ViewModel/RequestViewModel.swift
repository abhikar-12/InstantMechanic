//
//  RequestViewModel.swift
//  InstantMechanic
//
//  Created by Abhishek Kusalkar on 03/09/26.
//

import Foundation
import Combine

final class RequestViewModel: ObservableObject {
    @Published var requests: [ServiceRequest] = []

    func addRequest(
        serviceType: String,
        vehicleNumber: String,
        location: String,
        problemDescription: String
    ) {
        let newRequest = ServiceRequest(
            serviceType: serviceType,
            vehicleNumber: vehicleNumber,
            location: location,
            problemDescription: problemDescription
        )

        requests.append(newRequest)
    }

    func deleteRequest(id: UUID) {
        requests.removeAll { $0.id == id }
    }
}

