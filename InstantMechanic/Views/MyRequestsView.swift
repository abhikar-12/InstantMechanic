//
//  MyRequestsView.swift
//  InstantMechanic
//
//  Created by Abhishek Kusalkar on 03/09/26.
//

import SwiftUI

struct MyRequestsView: View {
    @ObservedObject var requestViewModel: RequestViewModel
    @State private var searchText = ""

    private var filteredRequests: [ServiceRequest] {
        requestViewModel.requests.filter { request in
            searchText.isEmpty ||
            request.serviceType.localizedCaseInsensitiveContains(searchText) ||
            request.vehicleNumber.localizedCaseInsensitiveContains(searchText) ||
            request.location.localizedCaseInsensitiveContains(searchText) ||
            request.problemDescription.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        List {
            if requestViewModel.requests.isEmpty {
                ContentUnavailableView(
                    "No Requests",
                    systemImage: "wrench.and.screwdriver",
                    description: Text("You haven't requested any service yet.")
                )
            } else if filteredRequests.isEmpty {
                ContentUnavailableView(
                    "No Matching Requests",
                    systemImage: "magnifyingglass",
                    description: Text("Try another search term.")
                )
            } else {
                ForEach(filteredRequests) { request in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(request.serviceType)
                            .font(.headline)

                        Text("Vehicle: \(request.vehicleNumber)")
                        Text("Location: \(request.location)")

                        Text(request.problemDescription)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 5)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            requestViewModel.deleteRequest(id: request.id)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
        }
        .navigationTitle("My Requests")
        .searchable(text: $searchText, prompt: "Search your requests")
    }
}
