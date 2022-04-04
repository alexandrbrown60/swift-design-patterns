//
//  CatalogBuilder.swift
//  Builder
//
//  Created by Александр Иванов on 04.04.2022.
//

import UIKit

class CatalogBuilder: ModuleBuilder {
    
    var title: String?
    
    func setTitle(_ title: String) -> CatalogBuilder {
        self.title = title
        return self
    }
    
    // Собираем каталог из разных классов,
    // устанавливаем зависимости
    
    func build() -> UIViewController {
        guard let title = title else { fatalError("Вы должны добавить Title") }
        
        let presenter = CatalogPresenter()
        let interactor = CatalogInteractor(presenter: presenter)
        let viewController = CatalogViewController(title: title, interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
