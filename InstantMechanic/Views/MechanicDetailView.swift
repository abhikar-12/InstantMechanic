//
//  MechanicDetailView.swift
//  InstantMechanic
//
//  Created by Abhishek Kusalkar on 03/09/26.
//

import SwiftUI

struct MechanicDetailView: View {
    let mechanic: Mechanic
    @ObservedObject var requestViewModel: RequestViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(mechanic.name)
                    .font(.title)
                    .fontWeight(.bold)

                HStack {
                    Label(
                        "\(mechanic.rating, specifier: "%.1f")",
                        systemImage: "star.fill"
                    )
                    .foregroundStyle(.orange)

                    Text("• \(mechanic.distance, specifier: "%.1f") km away")
                        .foregroundStyle(.secondary)
                }
                .font(.headline)

                Divider()

                DetailRow(
                    title: "Address",
                    value: mechanic.location,
                    icon: "mappin.and.ellipse"
                )

                VStack(alignment: .leading, spacing: 8) {
                    Label("Services", systemImage: "wrench.and.screwdriver")
                        .font(.headline)

                    ForEach(mechanic.services, id: \.self) { service in
                        Text("• \(service)")
                    }
                }

                DetailRow(
                    title: "Working Hours",
                    value: mechanic.workingHours,
                    icon: "clock"
                )

                DetailRow(
                    title: "Phone",
                    value: mechanic.phoneNumber,
                    icon: "phone"
                )

                NavigationLink {
                    RequestServiceView(requestViewModel: requestViewModel)
                } label: {
                    Text("Request Service")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.top, 8)
            }
            .padding()
        }
        .navigationTitle("Mechanic Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailRow: View {
    let title: String
    let value: String
    let icon: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .frame(width: 25)
                .foregroundStyle(.blue)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)

                Text(value)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
