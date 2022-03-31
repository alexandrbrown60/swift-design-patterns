//
//  GoogleAuthenticator.swift
//  Adapter example
//
//  Created by Александр Иванов on 31.03.2022.
//

import Foundation

public struct GoogleUser {
    public var email: String
    public var password: String
    public var token: String
}

public class GoogleAuthenticator {
    public func login(
        email: String,
        password: String,
        completion: @escaping (GoogleUser?, Error?) -> Void) {
            let token = "special-token-value"
            
            let user = GoogleUser(email: email, password: password, token: token)
            
            completion(user, nil)
        }
}
