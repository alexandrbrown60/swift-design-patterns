//
//  ImageViewController.swift
//  Proxy
//
//  Created by Александр Иванов on 01.04.2022.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    let url = URL(string: "https://pngimg.com/uploads/pizza/pizza_PNG7149.png")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()
        
    }
    
    //Очищаем кэш и снова получаем изображение из интернета
    @IBAction func refreshImage(_ sender: UIButton) {
        cacheData = nil
        image.image = nil
        loadImage()
    }
    
    func loadImage() {
        let imageService = LoadImageService()
        let proxy = Proxy(service: imageService)
        
        proxy.loadImage(url: url) { [weak self] data, response, error in
            
            guard let self = self, let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.image.image = UIImage(data: data)
            }
        }
    }
    
}
