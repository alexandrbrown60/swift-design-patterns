import Foundation

//Закрываем класс от наследования с помощью приставки final
final class Singleton {
    var property: Int = 1
    
    //Создаем глобальную переменную с помощью приставки static
    static let shared = Singleton()
    
    //Ставим приватный инициализатор
    private init() {}
    
    func foo() {
        print("Hello, i'm singleton")
    }
}

//Вызов singletone
print(Singleton.shared.property)

Singleton.shared.foo()

Singleton.shared.property = 2
print(Singleton.shared.property)
