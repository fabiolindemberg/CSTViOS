//
//  ServiceProtocol.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

protocol ServiceProtocol: AnyObject {
    /// fetches today's matches that are running or already ended from api
    func fetchTodaysMatches() async -> Result<[Match], ServiceError>
    /// fetches futures matches from api
    func fetchFutureMatches(_ page: Int, perPage: Int) async -> Result<[Match], ServiceError>
    /// Fatch players from a given match from API
    func fetchPlayers(matchId: Int) async -> Result<Opponents, ServiceError>
}
