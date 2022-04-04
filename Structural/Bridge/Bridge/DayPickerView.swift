//
//  DayPickerView.swift
//  Bridge
//
//  Created by Александр Иванов on 04.04.2022.
//

import UIKit

protocol DayPickerDataSource {
    func dayPickerCount(_ dayPicker: DayPickerView) -> Int
    func dayPickerTitle(_ dayPicker: DayPickerView, indexPath: IndexPath) -> String
}

class DayPickerView: UIControl {
    //Конфигурируем view только тогда, когда передан dataSource
    public var dataSource: DayPickerDataSource? {
        didSet {
            setupView()
        }
    }
    
    private var buttons: [UIButton] = []
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    func setupView() {
        let count = dataSource?.dayPickerCount(self)
        
        for item in 0..<count! {
            let indexPath = IndexPath(row: item, section: 0)
            let title = dataSource?.dayPickerTitle(self, indexPath: indexPath)
            
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(UIColor.systemGray, for: .normal)
            button.setTitleColor(UIColor.white, for: .selected)
            button.tag = item
            button.addTarget(self, action: #selector(pickDay), for: .touchUpInside)
            
            buttons.append(button)
            
            self.addSubview(button)
        }
        
        self.addSubview(stackView)
    }
    
    @objc func pickDay(sender: UIButton) {
        for b in buttons {
            b.isSelected = false
        }
        
        let index = sender.tag
        let button = buttons[index]
        button.isSelected = true
        
    }
}
