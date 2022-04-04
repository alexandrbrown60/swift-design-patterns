//
//  ViewController.swift
//  Flyweight
//
//  Created by Александр Иванов on 04.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Создадим статические свойста
        // Они будут указывать на одну и ту же ячейку в памяти и их ссылки буду равны
        let whiteColor = UIColor.white
        let whiteColor2 = UIColor.white
        
        print(whiteColor === whiteColor2) //true
        
        
        // 2. Тепер создадим объекты класса. Даже если они обладают
        // одинаковыми свойствами, они занимают разные ячейки памяти.
        let color = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        let color2 = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        
        print(color === color2) //false
        
        // 4. Данные объекты будут равны
        let flyColor = UIColor.rgba(1, 0, 0, 1)
        let flyColor2 = UIColor.rgba(1, 0, 0, 1)
        
        print(flyColor === flyColor2) //true
    }


}

// 3. Чтобы решить эту проблему, расширим класс UIColor
extension UIColor {
    // Создадим массив для хранения цветов
    static var colorStore: [String: UIColor] = [:]
    
    // А также метод, который будет обрабатывать colorStore
    class func rgba(_ red: CGFloat,
                    _ green: CGFloat,
                    _ blue: CGFloat,
                    _ alpha: CGFloat) -> UIColor {
        
        let key = "\(red)\(green)\(blue)\(alpha)"
        
        //Делаем проверку на наличие массива
        if let color = colorStore[key] {
            return color
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        colorStore[key] = color
        return color
        
    }
}

