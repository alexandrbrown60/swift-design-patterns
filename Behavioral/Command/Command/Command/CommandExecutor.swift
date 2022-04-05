//
//  CommandExecutor.swift
//  Command
//
//  Created by Александр Иванов on 05.04.2022.
//

import Foundation

class CommandExecutor {
    private var arrayOfCommand = [BaseCommand]()
    
    func addCommand(_ command: BaseCommand) {
        arrayOfCommand.append(command)
    }
    
    func forward(_ str: String) {
        for command in arrayOfCommand {
            command.forward(str)
        }
    }
    
    func undoLast() -> String {
        var title = String()
        
        for command in arrayOfCommand {
            title = command.undo()
        }
        
        return title
    }
}
