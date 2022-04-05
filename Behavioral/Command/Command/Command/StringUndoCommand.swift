//
//  StringUndoCommand.swift
//  Command
//
//  Created by Александр Иванов on 05.04.2022.
//

import Foundation

class StringUndoCommand: BaseCommand {
    private var originalString: String
    private var currentString: String
    
    init(argument: String) {
        originalString = argument
        currentString = argument
    }
    
    func forward(_ str: String) {
        currentString.append(str)
    }
    
    func undo() -> String {
        currentString.removeLast()
        return currentString
    }
}
