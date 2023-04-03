//
//  Constants.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

struct Constants {
    struct API {
        static let baseUrl = "https://api.pandascore.co/"
        static let headers = [
            "accept":"application/json",
            "authorization":"Bearer kH0ACSMJl0kXxdVVSN49ohqKOYNeVV2xEc-9p82YhY98BvtG-X8"
        ]

        struct EndPoint {
            static let matches = "csgo/matches?"
            static let opponents = "matches/%d/opponents"
        }
    }
    
    struct Views {
        static let matchesTitle = "Partidas"
    }
}
