//
//  ViewController.swift
//  Decarator pattern
//
//  Created by Александр Иванов on 01.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var pizza: PizzaProtocol = Pizza()
    
    @IBOutlet weak var pizzaName: UILabel! {
        didSet {
            pizzaName.text = pizza.getName()
        }
    }
    
    @IBOutlet weak var price: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeSize(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            pizza = Pizza()
            pizzaName.text = pizza.getName()
            price.text = String(pizza.getPrice())
        case 1:
            pizza = Pizza()
            let mediumSize = MediumSize(decorate: pizza)
            pizzaName.text = mediumSize.getName()
            price.text = String(mediumSize.getPrice())
        case 2:
            pizza = Pizza()
            let bigSize = BigSize(decorate: pizza)
            pizzaName.text = bigSize.getName()
            price.text = String(bigSize.getPrice())
        default:
            break
        }
    }
    
}

