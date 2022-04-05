//
//  ViewController.swift
//  Facade
//
//  Created by Александр Иванов on 05.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let imageSaver = ImageSaverFacade()
    let image = UIImage(named: "folder")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        do {
            try imageSaver.save(image: image, type: .png, fileName: "my_file_name", overwrite: true)
        } catch {
            print(error)
        }
        
    }

}

