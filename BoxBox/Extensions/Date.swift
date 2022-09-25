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
            case 0:
                return "JAN"
            case 1:
                return "FEB"
            case 2:
                return "MAR"
            case 3:
                return "APR"
            case 4:
                return "MAY"
            case 5:
                return "JUN"
            case 6:
                return "JUL"
            case 7:
                return "AUG"
            case 8:
                return "SEP"
            case 9:
                return "OCT"
            case 10:
                return "NOV"
            case 11:
                return "DEC"
            default:
                return "JAN"
        }
    }
}
