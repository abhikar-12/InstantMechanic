//
//  ContentView.swift
//  InstantMechanic
//
//  Created by Abhishek Kusalkar on 03/09/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = MechanicViewModel()
    @StateObject private var requestViewModel = RequestViewModel()

    @State private var searchText = ""
    @State private var selectedService = "All Services"
    @State private var showOnlyOpen = false

    @AppStorage("appAppearance") private var appAppearance = "system"

    private var availableServices: [String] {
        ["All Services"] +
        Array(Set(viewModel.mechanics.flatMap(\.services))).sorted()
    }

    private var filteredMechanics: [Mechanic] {
        viewModel.mechanics.filter { mechanic in
            let matchesSearch =
                searchText.isEmpty ||
                mechanic.name.localizedCaseInsensitiveContains(searchText) ||
                mechanic.location.localizedCaseInsensitiveContains(searchText) ||
                mechanic.services.contains {
                    $0.localizedCaseInsensitiveContains(searchText)
                }

            let matchesService =
                selectedService == "All Services" ||
                mechanic.services.contains(selectedService)

            let matchesOpenStatus = !showOnlyOpen || mechanic.isOpen

            return matchesSearch && matchesService && matchesOpenStatus
        }
    }

    private var selectedColorScheme: ColorScheme? {
        switch appAppearance {
        case "light":
            return .light
        case "dark":
            return .dark
        default:
            return nil
        }
    }

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading && viewModel.mechanics.isEmpty {
                    ProgressView("Loading mechanics...")
                } else if let errorMessage = viewModel.errorMessage,
                          viewModel.mechanics.isEmpty {
                    ContentUnavailableView(
                        "Something went wrong",
                        systemImage: "exclamationmark.triangle",
                        description: Text(errorMessage)
                    )
                } else {
                    List(filteredMechanics) { mechanic in
                        NavigationLink {
                            MechanicDetailView(
                                mechanic: mechanic,
                                requestViewModel: requestViewModel
                            )
                        } label: {
                            MechanicRowView(mechanic: mechanic)
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        await viewModel.fetchMechanics()
                    }
                    .overlay {
                        if filteredMechanics.isEmpty {
                            ContentUnavailableView(
                                "No Mechanics Found",
                                systemImage: "magnifyingglass",
                                description: Text(
                                    "Try changing your search or filters."
                                )
                            )
                        }
                    }
                }
            }
            .navigationTitle("Mechanics")
            .searchable(
                text: $searchText,
                prompt: "Search mechanics, locations, or services"
            )
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        Picker("Service", selection: $selectedService) {
                            ForEach(availableServices, id: \.self) { service in
                                Text(service).tag(service)
                            }
                        }

                        Toggle("Open now only", isOn: $showOnlyOpen)
                    } label: {
                        Image(
                            systemName: "line.3.horizontal.decrease.circle"
                        )
                    }
                    .accessibilityLabel("Filter mechanics")
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        appAppearance =
                            appAppearance == "dark" ? "light" : "dark"
                    } label: {
                        Image(
                            systemName: appAppearance == "dark"
                                ? "sun.max.fill"
                                : "moon.fill"
                        )
                    }
                    .accessibilityLabel("Toggle dark mode")
                }

                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        MyRequestsView(requestViewModel: requestViewModel)
                    } label: {
                        Image(systemName: "list.clipboard")
                    }
                    .accessibilityLabel("My requests")
                }
            }
            .task {
                await viewModel.fetchMechanics()
            }
        }
        .preferredColorScheme(selectedColorScheme)
    }
}


#Preview {
    HomeView()
}
