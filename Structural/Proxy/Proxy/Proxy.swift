//
//  Proxy.swift
//  Proxy
//
//  Created by Александр Иванов on 01.04.2022.
//

import Foundation

//В роли кэша в проекте будет выступать глобальная переменная
var cacheData: Data?

class Proxy: LoadServiceProtocol {
    private var service: LoadServiceProtocol
    
    init(service: LoadServiceProtocol) {
        self.service = service
    }
    
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        
        //Вызываем загрузку изображения, если в кэш чист
        if cacheData == nil {
            service.loadImage(url: url) { data, response, error in
                cacheData = data
                completion(data, response, error)
            }
        } else {
            completion(cacheData, nil, nil)
        }
        
    }
}
