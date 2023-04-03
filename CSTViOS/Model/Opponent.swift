//
//  Opponent.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

struct Opponent: Codable {
    let opponent: Team
}

struct Opponents: Codable {
    let opponents: [Team]
}
