//
//  OpponentPlayers.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

struct OpponentPlayers: Identifiable {
    let id = UUID()
    let playerTeamOne: Player?
    let playerTeamTwo: Player?
}
