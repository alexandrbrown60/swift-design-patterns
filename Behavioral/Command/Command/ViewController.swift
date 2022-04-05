//
//  ViewController.swift
//  Command
//
//  Created by Александр Иванов on 05.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    let commandExecutor = CommandExecutor()
    var undoCommand: StringUndoCommand?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }

    
    @IBAction func undoAction(_ sender: UIButton) {
        textField.text = commandExecutor.undoLast()
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        undoCommand = StringUndoCommand(argument: textField.text!)
        commandExecutor.addCommand(undoCommand!)
        commandExecutor.forward(string)
        
        return true
        
    }
}

