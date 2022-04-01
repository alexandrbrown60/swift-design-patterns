//
//  LoadService.swift
//  Proxy
//
//  Created by Александр Иванов on 01.04.2022.
//

import Foundation

protocol LoadServiceProtocol {
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}
