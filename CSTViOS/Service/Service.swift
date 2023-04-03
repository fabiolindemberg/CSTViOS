//
//  Service.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

class Service: ServiceProtocol {
    func fetchFutureMatches(_ page: Int = 1) async -> Result<[Match], ServiceError> {
        let stringUrl = Constants.API.baseUrl + Constants.API.EndPoint.matches

        guard let url = URL(string: stringUrl) else {
            return .failure(.badURL)
        }
        
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.API.headers
        request.url?.append(queryItems: [
            .init(name: "filter[future]", value: "true"),
            .init(name: "filter[status]", value: "not_started"),
            .init(name: "sort", value: "begin_at"),
            .init(name: "page", value: "\(page)"),
            .init(name: "per_page", value: "10")
        ])

        do {
            let (data, genericResponse) = try await URLSession.shared.data(for: request as URLRequest)
            let response = genericResponse as? HTTPURLResponse
            
            guard let statusCode = response?.statusCode,
                    statusCode == 200 else {
                return .failure(.invalidResponse(statusCode: response?.statusCode ?? -1,
                                                 message: response?.description ?? ""))
            }

            return data.decode()
        } catch {
            return .failure(.badRequest(message: error.localizedDescription))
        }
    }

    func fetchTodaysMatches() async -> Result<[Match], ServiceError> {
        let stringUrl = Constants.API.baseUrl + Constants.API.EndPoint.matches

        guard let url = URL(string: stringUrl) else {
            return .failure(.badURL)
        }
        
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.API.headers
        request.url?.append(queryItems: [
            .init(name: "range[begin_at]", value: "\(Date.todayString),\(Date.tomorrowString)"),
            .init(name: "filter[status]", value: "running,finished"),
            .init(name: "sort", value: "-status,begin_at"),
        ])

        do {
            let (data, genericResponse) = try await URLSession.shared.data(for: request as URLRequest)
            let response = genericResponse as? HTTPURLResponse
            
            guard let statusCode = response?.statusCode,
                    statusCode == 200 else {
                return .failure(.invalidResponse(statusCode: response?.statusCode ?? -1,
                                                 message: response?.description ?? ""))
            }

            return data.decode()
        } catch {
            return .failure(.badRequest(message: error.localizedDescription))
        }
    }
    
    func fetchPlayers(matchId: Int) async -> Result<Opponents, ServiceError> {
        let stringUrl = Constants.API.baseUrl + String.init(format: Constants.API.EndPoint.opponents, matchId)

        guard let url = URL(string: stringUrl) else {
            return .failure(.badURL)
        }

        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Constants.API.headers

        do {
            let (data, genericResponse) = try await URLSession.shared.data(for: request as URLRequest)
            let response = genericResponse as? HTTPURLResponse
            
            guard let statusCode = response?.statusCode,
                    statusCode == 200 else {
                return .failure(.invalidResponse(statusCode: response?.statusCode ?? -1,
                                                 message: response?.description ?? ""))
            }

            return data.decode()
        } catch {
            return .failure(.badRequest(message: error.localizedDescription))
        }
    }
}
