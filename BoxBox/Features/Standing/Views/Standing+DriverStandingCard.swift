//
//  Standing+DriverStandingCard.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-23.
//

import SwiftUI

extension Standing.View {
    struct DriverStandingCard: View {
        let standing: Models.DriverStandings

        var body: some View {
            ZStack {
                HStack {
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(standing.points)
                            .font(.title)
                            .bold()
                            .italic()
                            .foregroundColor(Color(hex: "C7C9CB"))
                        Text("pts.")
                            .bold()
                            .italic()
                            .font(.caption)
                            .foregroundColor(Color(hex: "C7C9CB"))
                    }
                }

                HStack(spacing: 15) {
                    Text(standing.positionText)
                        .font(.title)
                        .italic()
                        .bold()
                        .foregroundColor(Color(hex: "343D42"))
                        .minimumScaleFactor(0.01)
                        .frame(width: 40)

                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(standing.driver.givenName) \(standing.driver.familyName)")
                            .font(.system(.title2, design: .rounded))
                            .bold()

                        Text(standing.constructors.name)
                            .font(.footnote)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .background(
                                Capsule()
                                    .fill(standing.constructors.color)
                            )
                    }
                    Spacer()
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(.white)
            .cornerRadius(12)
        }
    }
}

struct Standing_DriverStandingCard_Previews: PreviewProvider {
    static var previews: some View {
        Standing.View.DriverStandingCard(standing: .mock1)
            .padding()
            .background(.gray)
            .previewLayout(.sizeThatFits)
    }
}
