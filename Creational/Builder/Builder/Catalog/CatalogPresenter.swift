//
//  CatalogPresenter.swift
//  Builder
//
//  Created by Александр Иванов on 04.04.2022.
//

import Foundation

protocol Presenter {
    var message: String { get }
}

class CatalogPresenter: Presenter {
    weak var viewController: CatalogViewController?
    
    var message = "Создание viewModel"
}
