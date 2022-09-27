//
//  RaceDetails+SessionSchedule.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-27.
//

import SwiftUI

extension RaceDetails.View {
    struct SessionSchedule: View {
        let race: Models.Schedule
        let time: Models.RaceTime
        let sessionType: SessionType

        var body: some View {
            HStack {
                VStack {
                    Text(time.day)
                        .font(.title2)
                        .italic()
                        .bold()
                    Text(time.month)
                        .font(.callout)
                        .italic()
                        .bold()
                }
                .foregroundColor(Color(hex: "343D42"))
                .minimumScaleFactor(0.01)
                .frame(width: 40)

                VStack(alignment: .leading) {
                    Text(sessionType.rawValue)
                        .font(.system(.title2, design: .rounded))
                        .bold()
                        .lineLimit(1)

                    Text(time.dateUTC?
                        .formatted(date: .omitted, time: .shortened)
                        ?? "")
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

struct RaceDetails_SessionSchedule_Previews: PreviewProvider {
    static var previews: some View {
        RaceDetails.View.SessionSchedule(race: .mock3, time: .mock3, sessionType: .fp1)
            .padding()
            .background(.gray)
            .previewLayout(.sizeThatFits)
    }
}
