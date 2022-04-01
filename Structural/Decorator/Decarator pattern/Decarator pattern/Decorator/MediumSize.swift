//
//  MediumSize.swift
//  Decarator pattern
//
//  Created by Александр Иванов on 01.04.2022.
//

import Foundation

class MediumSize: PizzaDecorator {
    //принимаем класс, который будем декорировать
    required init(decorate: PizzaProtocol) {
        super.init(decorator: decorate)
    }
    
    //переопределяем методы родительского класса
    override func getName() -> String {
        return super.getName() + " - средняя"
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 150
    }
}
