//
//  LoadImageService.swift
//  Proxy
//
//  Created by Александр Иванов on 01.04.2022.
//

import Foundation

class LoadImageService: LoadServiceProtocol {
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        //Здесь не используется стандартный URLSession,
        //так как он кэшиурет данные, что не соответствует цели проекта -
        //показать, как работает Proxy
        
        //Поэтому мы создаем свой объект URLSession
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        let session = URLSession.init(configuration: config)
        
        session.dataTask(with: url, completionHandler: completion).resume()
    }
   
}
