//
//  Data+decode.swift
//  CSTViOS
//
//  Created by Fabio Lindemberg on 03/04/23.
//

import Foundation

extension Data {
    func decode<T: Decodable>() -> Result<T, ServiceError> {
        do {
            let object = try JSONDecoder().customDecoder.decode(T.self, from: self)
            return .success(object)
        } catch(let parseError) {
            print(parseError)
            return .failure(.parseError)
        }
    }
    
    func decode<T: Decodable>() -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try? decoder.decode(T.self, from: self)
    }
}
