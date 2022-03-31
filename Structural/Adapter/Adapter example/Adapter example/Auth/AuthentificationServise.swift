//
//  AuthentificationServise.swift
//  Adapter example
//
//  Created by Александр Иванов on 31.03.2022.
//

import Foundation

public struct User {
    public let email: String
    public let password: String
}

public struct Token {
    public let value: String
}

public protocol AuthentificationServise {
    func login(email: String,
               password: String,
               success: @escaping(User, Token) -> Void,
               failure: @escaping (Error?) -> Void)
    
}
