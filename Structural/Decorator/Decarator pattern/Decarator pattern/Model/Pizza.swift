//
//  Pizza.swift
//  Decarator pattern
//
//  Created by Александр Иванов on 01.04.2022.
//

import Foundation

protocol PizzaProtocol {
    func getName() -> String
    func getPrice() -> Double
}

class Pizza: PizzaProtocol {
    
    private let name: String = "Маргарита"
    
    func getName() -> String {
        return self.name
    }
    
    func getPrice() -> Double {
        return 200
    }
     
}
