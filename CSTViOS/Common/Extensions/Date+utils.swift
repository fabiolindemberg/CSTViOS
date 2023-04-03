//
//  Date+utils.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

extension Date {
    var shortDateTime: String {
        self.formatted(date: .abbreviated, time: .shortened)
    }

    static var todayString: String {
        Date().ISO8601Format(.iso8601Date(timeZone: .current))
    }
    
    static var tomorrowString: String {
        let calendar = Calendar.current
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date())!
        return tomorrow.ISO8601Format(.iso8601Date(timeZone: .current))
    }
}
