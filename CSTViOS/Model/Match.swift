//
//  Match.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

struct Match: Codable, Identifiable {
    let id: Int
    let opponents: [Opponent]
    let league: League
    let serie: Serie
    let status: Status
    let beginAt: Date

    enum Status: String {
        case notStarted = "not_started"
        case running = "running"
        case finished = "finished"
        case canceled = "canceled"
        case scheduledAt = "scheduled_at"
    }
    
    enum CodingKeys: CodingKey {
        case id
        case opponents
        case league
        case serie
        case status
        case beginAt
    }
    
    init(id: Int, opponents: [Opponent], league: League, serie: Serie, status: Status, beginAt: Date) {
        self.id = id
        self.opponents = opponents
        self.league = league
        self.serie = serie
        self.status = status
        self.beginAt = beginAt
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        opponents = try container.decode([Opponent].self, forKey: .opponents)
        league = try container.decode(League.self, forKey: .league)
        serie = try container.decode(Serie.self, forKey: .serie)
        beginAt = try container.decode(Date.self, forKey: .beginAt)
        // Parsing status from string to enum
        status = Status(rawValue: try container.decode(String.self, forKey: .status))!
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(opponents, forKey: .opponents)
        try container.encode(league, forKey: .league)
        try container.encode(serie, forKey: .serie)
        try container.encode(status.rawValue, forKey: .status)
        try container.encode(beginAt, forKey: .beginAt)
    }
}

extension Match {
    var teamOne: Team? {
        opponents.first?.opponent
    }
    
    var teamTwo: Team? {
        opponents.last?.opponent
    }
    
    var leaguePlusSerie: String {
        let serieName = serie.name == nil ? "" : " + \(serie.name!)"
        
        return league.name + serieName
    }
}
