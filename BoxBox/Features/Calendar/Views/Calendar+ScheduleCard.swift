//
//  Calendar+ScheduleCard.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-25.
//

import SwiftUI

extension Calendar.View {
    struct ScheduleCard: View {
        let race: Models.Schedule

        var body: some View {
            HStack {
                VStack {
                    Text(race.raceTime.day)
                        .font(.title2)
                        .italic()
                        .bold()
                    Text(race.raceTime.month)
                        .font(.callout)
                        .italic()
                        .bold()
                }
                .foregroundColor(Color(hex: "343D42"))
                .minimumScaleFactor(0.01)
                .frame(width: 35)

                VStack(alignment: .leading) {
                    HStack {
                        Text("Round \(race.round)")
                            .foregroundColor(.red)
                            .font(.system(.footnote, design: .rounded))

                        if race.isSprint {
                            Text("Sprint")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .background(
                                    Capsule()
                                        .fill(.red)
                                )
                        }
                    }

                    Text(race.name)
                        .font(.system(.title2, design: .rounded))
                        .bold()
                        .lineLimit(1)
                    Text(race.circuit.circuitName)
                        .foregroundColor(.gray)
                }
                .font(.footnote)
                .padding(.horizontal)

                Spacer()
                Image(systemName: "chevron.forward")
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(.white)
            .cornerRadius(12)
        }
    }
}

struct Calendar_ScheduleCard_Previews: PreviewProvider {
    static var previews: some View {
        Calendar.View.ScheduleCard(race: .mock3)
            .padding()
            .background(.gray)
            .previewLayout(.sizeThatFits)
    }
}
