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
