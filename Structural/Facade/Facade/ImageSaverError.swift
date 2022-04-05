//
//  ImageSaverError.swift
//  Facade
//
//  Created by Александр Иванов on 05.04.2022.
//

import UIKit

enum ImageSaverError: Error {
    case couldNotCreateDestinationPath
    case couldNotCreateJPEGDataFromImage
    case couldNotCreatePNGDataFromImage
    case couldNotSaveImageDestinationPath
}

enum ImageType {
    case png
    case jpeg(compressionQuiality: CGFloat)
}
