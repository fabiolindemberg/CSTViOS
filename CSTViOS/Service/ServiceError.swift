//
//  ServiceError.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

enum ServiceError: Error {
    case badURL
    case badRequest(message: String)
    case invalidResponse(statusCode: Int, message: String)
    case parseError
}
