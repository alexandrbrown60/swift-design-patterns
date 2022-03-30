import Foundation

//MARK: - Первый способ глубокого копирования - более простой
class Pizza {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func deepCopy() -> Pizza {
        return Pizza(name: self.name)
    }
}

var pepperoni = Pizza(name: pepperoni)
var pepperoniClone = pepperoni.deepCopy()

print(pepperoni === pepperoniClone) //false

//MARK: - Второй способ - более абстрактный
public protocol Copying {
    init(_ prototype: Self)
}

extension Copying {
    public func deepCopy() -> Self {
        return type(of: self).init(self)
    }
}

class Burger: Copying {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init(_ prototype: Burger) {
        self.init(name: prototype.name)
    }
}

var burger = Burger(name: "Humburger")
var burgerClone = burger.deepCopy()

print(burger === burgerClone) //false



