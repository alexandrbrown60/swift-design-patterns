import Foundation

//MARK: - Протоколы
//Создадим для наших будущих объектов
protocol Pizza {
    var name: String { get }
    var diameter: Int { get }
}

protocol Drink {
    var name: String { get }
    var size: Int { get }
}

protocol Burger {
    var name: String { get }
    var meat: String { get }
}

//MARK: - Классы объектов
//виды пицц
class Pepperoni: Pizza {
    var name = "Pepperoni"
    var diameter = 25
}

class Cheese: Pizza {
    var name = "Сырная"
    var diameter = 35
}

//напитки
class Coffee: Drink {
    var name = "Капучино"
    var size = 250
}

class Juice: Drink {
    var name = "Сок"
    var size = 350
}

//burger
class Humburger: Burger {
    var name = "Гамбургер"
    var meat = "Говядина"
}

class Fishburger: Burger {
    var name = "Бургер с рыбой"
    var meat = "Рыба"
}

//MARK: - Фабрики (пример)
//наша абстрактная фабрика
protocol AbstractFactory {
    func createPizza() -> Pizza
    func createDrink() -> Drink
    func createBurger() -> Burger
}

//затем обычные фабрики
class VegetarianFoodFactory: AbstractFactory {
    func createPizza() -> Pizza {
        return Cheese()
    }
    
    func createDrink() -> Drink {
        return Juice()
    }
    
    func createBurger() -> Burger {
        return Fishburger()
    }
    
}

class NonVegetarianFoodFactory: AbstractFactory {
    func createPizza() -> Pizza {
        return Pepperoni()
    }
    
    func createDrink() -> Drink {
        return Coffee()
    }
    
    func createBurger() -> Burger {
        return Humburger()
    }
    
}

//MARK: - Пример использования
var pizza: Pizza?
var drink: Drink?
var burger: Burger?

var vegetarian = VegetarianFoodFactory()

pizza = vegetarian.createPizza()
drink = vegetarian.createDrink()
burger = vegetarian.createBurger()

