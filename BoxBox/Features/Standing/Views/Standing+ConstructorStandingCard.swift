//
//  Standing+ConstructorStandingCard.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-23.
//

import SwiftUI

extension Standing.View {
    struct ConstructorStandingCard: View {
        let standing: Models.ConstructorStanding

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
                        Text(standing.constructor.name)
                            .font(.system(.title2, design: .rounded))
                            .bold()

                        Rectangle()
                            .fill(standing.constructor.color)
                            .frame(width: 80, height: 8, alignment: .leading)
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

struct Standing_ConstructorStandingCard_Previews: PreviewProvider {
    static var previews: some View {
        Standing.View.ConstructorStandingCard(standing: .mock1)
            .padding()
            .background(.gray)
            .previewLayout(.sizeThatFits)
    }
}
