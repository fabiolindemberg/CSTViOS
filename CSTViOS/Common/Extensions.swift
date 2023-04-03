//
//  Extensions.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import SwiftUI

extension JSONDecoder {
    var customDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}

extension Data {
    func decode<T: Decodable>() -> Result<T, ServiceError> {
        do {
            let object = try JSONDecoder().customDecoder.decode(T.self, from: self)
            return .success(object)
        } catch(let parseError) {
            print(parseError)
            return .failure(.parseError)
        }
    }
    
    func decode<T: Decodable>() -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try? decoder.decode(T.self, from: self)
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

extension Date {
    var shortDateTime: String {
        self.formatted(date: .abbreviated, time: .shortened)
    }
}

extension String {
    var url: URL? {
        URL(string: self)
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
