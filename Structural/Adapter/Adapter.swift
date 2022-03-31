import Foundation

//Допустим, у нас есть некоторый протокол Bird и класс Lark (жаворонок)
//оба реализованы на нашей стороне
protocol Bird {
    func fly()
    func sing()
}

class Lark: Bird {
    func fly() {
        print("Жаворонок летает")
    }
    
    func sing() {
        print("Чирик-чирик")
    }
}

//Затем, допустим на стороне сервера есть класс Raven (ворон), к которому мы не имеем доступа,
//либо не желаем модифицировать его, чтобы ничего не сломать
class Raven {
    func flapWings() {
        print("Ворон летает")
    }
    
    func voice() {
        print("Кар-кар")
    }
}

//Мы понимаем, что Raven - тоже птица. Однако мы хотим, чтобы он был совместим с нашим протоколом Bird
//Здесь мы и создаем наш Adapter
class RavenAdapter: Bird {
    private var raven: Raven
    
    init(adaptee: Raven) {
        self.raven = adaptee
    }
    
    func sing() {
        raven.flapWings()
    }
    
    func fly() {
        raven.voice()
    }
}

//Применяем наш адаптер
func birdTest(_ bird: Bird) {
    bird.fly()
    bird.sing()
}

let lark = Lark()
let raven = Raven()
let ravenAdapter = RavenAdapter(adaptee: raven)

birdTest(lark)
birdTest(ravenAdapter)
