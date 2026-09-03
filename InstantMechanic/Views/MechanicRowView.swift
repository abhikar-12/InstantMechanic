//
//  MechanicRowView.swift
//  InstantMechanic
//
//  Created by Abhishek Kusalkar on 03/09/26.
//

import SwiftUI

struct MechanicRowView: View {
    let mechanic: Mechanic

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundStyle(.blue)

            VStack(alignment: .leading, spacing: 7) {
                HStack {
                    Text(mechanic.name)
                        .font(.headline)

                    Spacer()

                    Text(mechanic.isOpen ? "Open" : "Closed")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(
                            mechanic.isOpen ? Color.green : Color.red
                        )
                        .padding(.horizontal, 9)
                        .padding(.vertical, 5)
                        .background(
                            mechanic.isOpen
                                ? Color.green.opacity(0.15)
                                : Color.red.opacity(0.15)
                        )
                        .clipShape(Capsule())
                }

                HStack {
                    Label(
                        String(format: "%.1f", mechanic.rating),
                        systemImage: "star.fill"
                    )
                    .foregroundStyle(.orange)

                    Text("• \(mechanic.distance, specifier: "%.1f") km")
                        .foregroundStyle(.secondary)
                }
                .font(.caption)

                Label(mechanic.location, systemImage: "mappin.and.ellipse")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text("Services: \(mechanic.services.joined(separator: " • "))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 8)
    }
}
