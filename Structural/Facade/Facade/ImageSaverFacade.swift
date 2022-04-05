//
//  ImageSaverFacade.swift
//  Facade
//
//  Created by Александр Иванов on 05.04.2022.
//

import UIKit

class ImageSaverFacade {
    private let pathProvider = PathProvider()
    private let dataProvider = ImageDataProvider()
    
    public func save(image: UIImage, type: ImageType, fileName: String, overwrite: Bool) throws {
        
        let destinationURL = try pathProvider.createDestinationPath(fileName: fileName)
        let imageData = try dataProvider.data(from: image, type: type)
        let writeOptions: Data.WritingOptions = overwrite ? (.atomic) : (.withoutOverwriting)
        
        try imageData.write(to: destinationURL, options: writeOptions)
        
    }
}
