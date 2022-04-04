//
//  CatalogIteractor.swift
//  Builder
//
//  Created by Александр Иванов on 04.04.2022.
//

import Foundation

protocol Interactor {
    init(presenter: Presenter)
}

class CatalogInteractor: Interactor {
    var presenter: Presenter!
    
    required init(presenter: Presenter) {
        self.presenter = presenter
    }
    
}
