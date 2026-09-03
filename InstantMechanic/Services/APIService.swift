//
//  APIService.swift
//  InstantMechanic
//
//  Created by Abhishek Kusalkar on 03/09/26.
//

import Foundation

enum APIServiceError: LocalizedError {
    case mechanicsDataNotFound

    var errorDescription: String? {
        switch self {
        case .mechanicsDataNotFound:
            return "The mechanics data file could not be found."
        }
    }
}

final class APIService {
    func fetchMechanics() async throws -> [Mechanic] {
        guard let url = Bundle.main.url(
            forResource: "mechanics",
            withExtension: "json"
        ) else {
            throw APIServiceError.mechanicsDataNotFound
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Mechanic].self, from: data)
    }
}

