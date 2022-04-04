//
//  ViewController.swift
//  Builder
//
//  Created by Александр Иванов on 04.04.2022.
//

import UIKit

class ViewController: UIViewController {

    // Здесь для примера Builder строит viewController
    @IBAction func catalogButtonDidTapped(_ sender: UIButton) {
        let controller = CatalogBuilder().setTitle("Catalog").build()
        self.present(controller, animated: true, completion: nil)
    }
    
}

