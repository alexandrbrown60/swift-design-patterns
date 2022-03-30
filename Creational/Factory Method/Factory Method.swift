import Foundation

//1. Создадим протокол продукта с некоторыми переменными
protocol Pizza {
    var name: String { get }
    var diameter: Int { get }
}

//2. Создадим несколько продуктов
class Pepperoni: Pizza {
    var name: String = "Pepperoni"
    var diameter: Int = 25
}

class Margarita: Pizza {
    var name: String = "Margarita"
    var diameter: Int = 32
}

class Vegetarian: Pizza {
    var name: String = "Vegetarian"
    var diameter: Int = 16
}

//3.1 Далее создаем фабрику. В этом методе я использую enum, который будет запрашивать фабрика
enum PizzaType {
    case pepperoni, margarita, vegetarian
}

class PizzaFactory {
    func createPizza(name: PizzaType) -> Pizza {
        switch name {
        case .pepperoni:
            return Pepperoni()
        case .margarita:
            return Margarita()
        case .vegetarian:
            return Vegetarian()
        }
    }
}

//3.2 Второй способ создать фабрику (как описано в документации)
protocol PizzaCreator {
    func createPizza() -> Pizza
}

class PepperoniFactory: PizzaCreator {
    func createPizza() -> Pizza {
        return Pepperoni()
    }
}

class MargaritaFactory: PizzaCreator {
    func createPizza() -> Pizza {
        return Margarita()
    }
}

class VegetarianFactory: PizzaCreator {
    func createPizza() -> Pizza {
        return Vegetarian()
    }
}

//Испечем наши пиццы с помощью фабрик
var pizza = [Pizza]()

func createPizza(_ pizza: PizzaType) {
    let pizzaFactory = PizzaFactory()
    let newPizza = pizzaFactory.createPizza(name: pizza)
}

createPizza(.margarita)

//Второй способ
let margaritaFactory = MargaritaFactory()
margaritaFactory.createPizza()
