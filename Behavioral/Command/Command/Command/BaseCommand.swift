//
//  BaseCommand.swift
//  Command
//
//  Created by Александр Иванов on 05.04.2022.
//

import Foundation

protocol BaseCommand {
    func undo() -> String
    func forward(_ str: String)
}
