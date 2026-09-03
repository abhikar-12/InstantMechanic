//
//  RequestServiceView.swift
//  InstantMechanic
//
//  Created by Abhishek Kusalkar on 03/09/26.
//

import SwiftUI

struct RequestServiceView: View {
    @ObservedObject var requestViewModel: RequestViewModel

    @State private var vehicleNumber = ""
    @State private var location = ""
    @State private var problemDescription = ""
    @State private var selectedService = "Car Service"
    @State private var showAlert = false
    @State private var alertMessage = ""

    private let services = [
        "Car Service",
        "Battery",
        "Tyre",
        "Brake",
        "AC Repair"
    ]

    var body: some View {
        Form {
            Section("Service Details") {
                Picker("Select Service", selection: $selectedService) {
                    ForEach(services, id: \.self) { service in
                        Text(service)
                    }
                }
            }

            Section("Vehicle Information") {
                TextField("Vehicle Number", text: $vehicleNumber)
                    .textInputAutocapitalization(.characters)
            }

            Section("Location") {
                TextField("Enter your location", text: $location)
            }

            Section("Describe Problem") {
                TextField(
                    "Describe your problem",
                    text: $problemDescription,
                    axis: .vertical
                )
                .lineLimit(3...6)
            }

            Section {
                Button {
                    submitRequest()
                } label: {
                    Text("Request Service")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationTitle("Request Service")
        .alert("Service Request", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }

    private func submitRequest() {
        let trimmedVehicleNumber = vehicleNumber.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        let trimmedLocation = location.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        let trimmedProblem = problemDescription.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !trimmedVehicleNumber.isEmpty,
              !trimmedLocation.isEmpty,
              !trimmedProblem.isEmpty else {
            alertMessage = "Please fill in all the details."
            showAlert = true
            return
        }

        requestViewModel.addRequest(
            serviceType: selectedService,
            vehicleNumber: trimmedVehicleNumber,
            location: trimmedLocation,
            problemDescription: trimmedProblem
        )

        vehicleNumber = ""
        location = ""
        problemDescription = ""
        alertMessage = "Your mechanic request has been submitted successfully!"
        showAlert = true
    }
}
