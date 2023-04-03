//
//  Player.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

struct Player: Codable {
    let id: Int
    let name: String?
    let firstName: String?
    let lastName: String?
    let imageUrl: String?
    var fullName: String {
        guard let lastName = lastName,
              let firstName = firstName else {
            return ""
        }
        
        return "\(lastName), \(firstName)"
    }
}
