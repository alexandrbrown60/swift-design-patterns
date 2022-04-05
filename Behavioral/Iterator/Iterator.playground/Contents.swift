import Foundation

// Создаем связанные список без явного указания типа
struct LinkedList<T> {
    // Начало связанного списка
    var head: LinkedListNode<T>
    
    init(head: LinkedListNode<T>) {
        self.head = head
    }
}

// Косвенное перечисление, которое имеет два кейса:
// 1. ссылающийся на следующий элемент
// 2. конец списка

// P.S. indirect дает возможность к рекурсивному использованию данного enum
indirect enum LinkedListNode<T> {
    case value(element: T, next: LinkedListNode<T>) // 1
    case end // 2
}


// Создаем элементы списка в обратном порядке
let element4 = LinkedListNode.value(element: 4, next: .end)
let element3 = LinkedListNode.value(element: 3, next: element4)
let element2 = LinkedListNode.value(element: 2, next: element3)
let element1 = LinkedListNode.value(element: 1, next: element2)

let list = LinkedList(head: element1)

// Мы всё еще не внедрили Iterator.
// При попытке прогнать list через цикл for
// мы получим ошибку.

// Поэтому расширяем наш LinkedList с помощью протокола Sequence,
// чтобы обеспечить итеративный доступ
extension LinkedList: Sequence {
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(current: head)
    }
}

// Создаем сам итератор
struct LinkedListIterator<T>: IteratorProtocol {
    var current: LinkedListNode<T>
    
    mutating func next() -> T? {
        switch current {
        case let .value(element, next):
            current = next
            return element
        case .end:
            return nil
        }
    }
}

// Протестируем наш связанные список на итеративный доступ
for i in list {
    print(i)
}

list.contains(3)

