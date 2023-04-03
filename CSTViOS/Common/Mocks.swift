//
//  Mocks.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

let mockJson = """
[{
        "begin_at": "2023-04-14T00:00:00Z",
        "detailed_stats": true,
        "draw": false,
        "end_at": null,
        "forfeit": false,
        "game_advantage": null,
        "games": [
            {
                "begin_at": null,
                "complete": false,
                "detailed_stats": true,
                "end_at": null,
                "finished": false,
                "forfeit": false,
                "id": 101412,
                "length": null,
                "match_id": 754512,
                "position": 1,
                "status": "not_started",
                "winner": {
                    "id": null,
                    "type": "Team"
                },
                "winner_type": "Team"
            },
            {
                "begin_at": null,
                "complete": false,
                "detailed_stats": true,
                "end_at": null,
                "finished": false,
                "forfeit": false,
                "id": 101413,
                "length": null,
                "match_id": 754512,
                "position": 2,
                "status": "not_started",
                "winner": {
                    "id": null,
                    "type": "Team"
                },
                "winner_type": "Team"
            },
            {
                "begin_at": null,
                "complete": false,
                "detailed_stats": true,
                "end_at": null,
                "finished": false,
                "forfeit": false,
                "id": 101414,
                "length": null,
                "match_id": 754512,
                "position": 3,
                "status": "not_started",
                "winner": {
                    "id": null,
                    "type": "Team"
                },
                "winner_type": "Team"
            }
        ],
        "id": 754512,
        "league": {
            "id": 4161,
            "image_url": null,
            "modified_at": "2019-03-04T11:00:40Z",
            "name": "IEM",
            "slug": "cs-go-iem",
            "url": null
        },
        "league_id": 4161,
        "live": {
            "opens_at": null,
            "supported": false,
            "url": null
        },
        "match_type": "best_of",
        "modified_at": "2023-04-02T08:20:35Z",
        "name": "Grand final: TBD vs TBD",
        "number_of_games": 3,
        "opponents": [],
        "original_scheduled_at": "2023-04-14T00:00:00Z",
        "rescheduled": false,
        "results": [],
        "scheduled_at": "2023-04-14T00:00:00Z",
        "serie": {
            "begin_at": "2023-04-12T19:00:00Z",
            "end_at": "2023-04-14T03:00:00Z",
            "full_name": "Dallas: South American Qualifier 2023",
            "id": 5829,
            "league_id": 4161,
            "modified_at": "2023-04-02T08:20:34Z",
            "name": "Dallas: South American Qualifier",
            "season": null,
            "slug": "cs-go-iem-dallas-south-american-qualifier-2023",
            "winner_id": null,
            "winner_type": null,
            "year": 2023
        },
        "serie_id": 5829,
        "slug": "2023-04-14",
        "status": "not_started",
        "streams_list": [],
        "tournament": {
            "begin_at": "2023-04-12T19:00:00Z",
            "end_at": "2023-04-14T03:00:00Z",
            "has_bracket": true,
            "id": 10365,
            "league_id": 4161,
            "live_supported": false,
            "modified_at": "2023-04-02T08:20:34Z",
            "name": "Playoffs",
            "prizepool": null,
            "serie_id": 5829,
            "slug": "cs-go-iem-dallas-south-american-qualifier-2023-playoffs",
            "tier": "c",
            "winner_id": null,
            "winner_type": "Team"
        },
        "tournament_id": 10365,
        "videogame": {
            "id": 3,
            "name": "CS:GO",
            "slug": "cs-go"
        },
        "videogame_version": null,
        "winner": null,
        "winner_id": null,
        "winner_type": "Team"
    }]
"""

let mockJsonOpponents = """
{"opponent_type":"Team","opponents":[{"acronym":null,"current_videogame":{"id":3,"name":"CS:GO","slug":"cs-go"},"id":127186,"image_url":"https://cdn.pandascore.co/images/team/image/127186/cde59e52_444e_4484_8b9d_feb494e8c4e5_qmjcs0x.png","location":"CH","modified_at":"2023-03-30T15:30:24Z","name":"Babos","players":[{"age":19,"birthday":null,"first_name":"Roberts","id":30360,"image_url":null,"last_name":"Poļakovs","modified_at":"2023-03-30T15:30:24Z","name":"Frip","nationality":"LV","role":null,"slug":"frip"},{"age":19,"birthday":null,"first_name":"Mārtiņš","id":30361,"image_url":null,"last_name":"Gūtmanis","modified_at":"2023-03-30T15:30:24Z","name":"shadiy","nationality":"LV","role":null,"slug":"shadiy"},{"age":20,"birthday":null,"first_name":"Diogo","id":33345,"image_url":null,"last_name":"Oliveira da Silva","modified_at":"2023-03-30T15:30:24Z","name":"Breaker","nationality":"PT","role":null,"slug":"breaker-diogo-oliveira-da-silva"},{"age":24,"birthday":null,"first_name":"Joao","id":33348,"image_url":null,"last_name":"Filipe Oliveira da Silva","modified_at":"2023-03-30T15:30:24Z","name":"NoRulezZ","nationality":"PT","role":null,"slug":"norulezz"},{"age":23,"birthday":null,"first_name":null,"id":40503,"image_url":null,"last_name":null,"modified_at":"2023-03-30T15:30:24Z","name":"Sixaer","nationality":"PT","role":null,"slug":"sixaer"}],"slug":"babos-gaming"},{"acronym":null,"current_videogame":{"id":3,"name":"CS:GO","slug":"cs-go"},"id":130526,"image_url":"https://cdn.pandascore.co/images/team/image/130526/109px_lausanne_sport_esports_lightmode.png","location":"","modified_at":"2023-03-30T12:52:36Z","name":"Lausanne-Sport Esports","players":[{"age":22,"birthday":null,"first_name":"Meris","id":24561,"image_url":null,"last_name":"Bihorac","modified_at":"2023-03-30T12:52:36Z","name":"merisinho","nationality":"RS","role":null,"slug":"merisinho"},{"age":23,"birthday":"1999-05-25","first_name":"Meriton","id":25348,"image_url":"https://cdn.pandascore.co/images/player/image/25348/600px_mali_cowana_gaming.png","last_name":"Ibrahimi","modified_at":"2023-03-30T12:52:36Z","name":"MALI","nationality":"CH","role":null,"slug":"mali"},{"age":21,"birthday":null,"first_name":"Nikola","id":27286,"image_url":null,"last_name":"Stankovic","modified_at":"2023-03-30T12:52:36Z","name":"n1kista","nationality":"CH","role":null,"slug":"n1kista"},{"age":34,"birthday":"1989-02-14","first_name":"Aleksandar","id":27785,"image_url":"https://cdn.pandascore.co/images/player/image/27785/ele_kz_at_fantasy_basel_2019.png","last_name":"Trajkov","modified_at":"2023-03-30T12:52:35Z","name":"eleKz","nationality":"CH","role":null,"slug":"elekz"},{"age":24,"birthday":null,"first_name":"Andrija","id":33717,"image_url":null,"last_name":"Ljubić","modified_at":"2023-03-30T15:24:06Z","name":"andr1x","nationality":"RS","role":null,"slug":"andr1x"}],"slug":"lausanne-sport-esports"}]}
"""

class ServiceMockFailure: ServiceProtocol {
    func fetchTodaysMatches() async -> Result<[Match], ServiceError> {
        return .failure(.parseError)
    }
    
    func fetchFutureMatches() async -> Result<[Match], ServiceError> {
        return .failure(.parseError)
    }
    
    func fetchPlayers(matchId: Int) async -> Result<Opponents, ServiceError> {
        return .failure(.badURL)
    }
}

class ServiceMockSuccess: ServiceProtocol {
    /// mock fetched matches data from static json string
    func fetchTodaysMatches() async -> Result<[Match], ServiceError> {
        let data = mockJson.data(using: .utf8)!
        return data.decode()
    }
    
    /// mock a successful but empty matches data from static json string
    func fetchFutureMatches() async -> Result<[Match], ServiceError> {
        return .success([])
    }
    
    /// mock fetched opponents players data from static json string
    func fetchPlayers(matchId: Int) async -> Result<Opponents, ServiceError> {
        let data = mockJsonOpponents.data(using: .utf8)!
        return data.decode()
    }
}

var matchMock: Match {
    let serie = Serie(id: 1, name: "Serie A")
    let league = League(id: 4854, name: "European Pro League", imageUrl: "https://cdn.pandascore.co/images/league/image/4854/european_pro_league_csgo_allmode-png")
    let teamOne = Team(id: 127279, imageUrl: "https://cdn.pandascore.co/images/team/image/127279/blink_al_std.png", name: "BLINK", players: [])
    let teamTwo = Team(id: 131389, imageUrl: "https://cdn.pandascore.co/images/team/image/131389/600px_ence_academy_2022_full_lightmode.png", name: "ENCE Academy", players: [])
    return Match(id: .random(in: 1000..<1999),
                 opponents: [Opponent(opponent: teamOne), Opponent(opponent: teamTwo)],
                 league: league, serie: serie, status: .notStarted, beginAt: Date())
}

var matchesMock: [Match] {
    [matchMock, matchMock]
}
