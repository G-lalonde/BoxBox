//
//  Models+RaceTime.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-25.
//

import Foundation

extension Models {
    struct RaceTime: Hashable {
        let time: String

        init(date: String, time: String) {
            self.date = date
            self.time = time
        }

        private let date: String
        private var utc: String {
            date + "T" + time
        }

        private var dateComponents: DateComponents? {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let localDate = formatter.date(from: utc)

            return localDate?.get(.day, .month, .year)
        }

        var day: String {
            if let day = dateComponents?.day {
                return String(day)
            }
            return "1"
        }

        var month: String {
            return Date.monthShortDescription(dateComponents?.month)
        }

        var year: String {
            if let year = dateComponents?.year {
                return String(year)
            }
            return "1970"
        }
    }
}

extension Models.RaceTime {
    static let mock1 = Models.RaceTime(
        date: "2022-03-20",
        time: "15:00:00Z"
    )

    static let mock2 = Models.RaceTime(
        date: "2022-03-27",
        time: "17:00:00Z"
    )

    static let mock3 = Models.RaceTime(
        date: "2022-05-08",
        time: "19:30:00Z"
    )
}
