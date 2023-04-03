//
//  ViewModelProtocol.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

@MainActor protocol ViewModelProtocol: AnyObject {
    /// Should be used to present a error messege to user
    var presentErrorMessage: Bool { get set }
    
    // Storage error information such as title and message to be displayed when presentErrorMessage is true
    var errorInfo: (title: String, message: String)? { get set }
    
    func handle(error: ServiceError)
}

extension ViewModelProtocol {
    // Reseved a generic error and handle it properly
    func handle(error: ServiceError) {
        switch error {
        case .badURL:
            errorInfo = (title: "Bad URl", message: error.localizedDescription)
        case .badRequest(message: let message):
            errorInfo = (title: "Bad Request", message: message)
        case .invalidResponse(statusCode: let statusCode, message: let message):
            errorInfo = (title: "Inexpected status code \(statusCode)", message: message)
        case .parseError:
            errorInfo = (title: "Parse error", message: error.localizedDescription)
        }
    }
}
