//
//  ViewController.swift
//  Bridge
//
//  Created by Александр Иванов on 04.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayPicker: DayPickerView!
    
    var days = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayPicker.dataSource = self
    }


}

extension ViewController: DayPickerDataSource {
    func dayPickerCount(_ dayPicker: DayPickerView) -> Int {
        return days.count
    }
    
    func dayPickerTitle(_ dayPicker: DayPickerView, indexPath: IndexPath) -> String {
        return days[indexPath.row]
    }
    
    
}

