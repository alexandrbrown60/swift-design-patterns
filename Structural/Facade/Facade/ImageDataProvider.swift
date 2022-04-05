//
//  ImageDataProvider.swift
//  Facade
//
//  Created by Александр Иванов on 05.04.2022.
//

import UIKit

// Класс для конвертации изображений
class ImageDataProvider {
    
    public func data(from image: UIImage, type: ImageType) throws -> Data {
        switch type {
        case .jpeg(let compressionQuiality):
            return try jpegData(from: image, compressionQuality: compressionQuiality)
        case .png:
            return try pngData(from: image)
        }
    }
    
    // Конвертация PNG
    private func pngData(from image: UIImage) throws -> Data {
        guard let imageData = image.pngData() else {
            throw ImageSaverError.couldNotCreatePNGDataFromImage
        }
        return imageData
    }
    
    // Конвертация JPEG
    private func jpegData(from image: UIImage, compressionQuality: CGFloat) throws -> Data {
        guard let imageData = image.jpegData(compressionQuality: compressionQuality) else {
            throw ImageSaverError.couldNotCreateJPEGDataFromImage
        }
        return imageData
    }
}
