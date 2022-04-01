//
//  PizzaDecorator.swift
//  Decarator pattern
//
//  Created by Александр Иванов on 01.04.2022.
//

import Foundation

class PizzaDecorator: PizzaProtocol {
    //принимаем класс, который будет декорировать
    private let decorator: PizzaProtocol
    
    init(decorator: PizzaProtocol) {
        self.decorator = decorator
    }
    
    func getName() -> String {
        return decorator.getName()
    }
    
    func getPrice() -> Double {
        return decorator.getPrice()
    }
    
    
}
