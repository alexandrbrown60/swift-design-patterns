//
//  PathProvider.swift
//  Facade
//
//  Created by Александр Иванов on 05.04.2022.
//

import Foundation

class PathProvider {
    
    func createDestinationPath(fileName: String) throws -> URL {
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            throw ImageSaverError.couldNotSaveImageDestinationPath
        }
        
        let destinationPath = path.appendingPathComponent("\(fileName)")
        print(destinationPath)
        return destinationPath
    }
    
}
