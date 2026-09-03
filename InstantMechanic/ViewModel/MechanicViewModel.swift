//
//  MechanicViewModel.swift
//  InstantMechanic
//
//  Created by Abhishek Kusalkar on 03/09/26.
//

import Foundation
import Combine

@MainActor
final class MechanicViewModel: ObservableObject {
    @Published var mechanics: [Mechanic] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let apiService = APIService()

    func fetchMechanics() async {
        isLoading = true
        errorMessage = nil

        do {
            mechanics = try await apiService.fetchMechanics()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
