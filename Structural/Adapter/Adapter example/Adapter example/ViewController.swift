//
//  ViewController.swift
//  Adapter example
//
//  Created by Александр Иванов on 31.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var authService: AuthentificationServise = GoogleAuthenticatorAdapter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUser(email: "user@example.com", password: "1234ssthjO")
    }
    
    //Создаем объект User с помощью адаптера 
    func createUser(email: String, password: String) {
        authService.login(email: email, password: password) { user, token in
            print("Auth succeeded: \(user.email), \(token.value)")
        } failure: { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }

    }


}

