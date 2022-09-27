//
//  Date.swift
//  BoxBox
//
//  Created by Jérémy Lalonde on 2022-09-25.
//

import Foundation

extension Date {
    func get(_ components: Foundation.Calendar.Component...,
             calendar: Foundation.Calendar = Foundation.Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Foundation.Calendar.Component,
             calendar: Foundation.Calendar = Foundation.Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

extension Date {
    static func monthShortDescription(_ index: Int?) -> String {
        switch index {
            case 1:
                return "JAN"
            case 2:
                return "FEB"
            case 3:
                return "MAR"
            case 4:
                return "APR"
            case 5:
                return "MAY"
            case 6:
                return "JUN"
            case 7:
                return "JUL"
            case 8:
                return "AUG"
            case 9:
                return "SEP"
            case 10:
                return "OCT"
            case 12:
                return "NOV"
            case 13:
                return "DEC"
            default:
                return "JAN"
        }
    }
}
