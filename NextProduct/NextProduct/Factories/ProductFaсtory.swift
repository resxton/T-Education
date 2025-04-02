//
//  ProductFaсtory.swift
//  NextProduct
//
//  Created by Сомов Кирилл on 02.04.2025.
//

import Foundation

protocol ProductFactoryProtocol {
    func nextProduct() -> Product
}

final class ProductFaсtory: ProductFactoryProtocol {
    
    // MARK: - Private Properties
    
    private var storage: [Product] = []
    private var currentIndex = 0
    
    // MARK: - Initializers
    
    init() {
        if let filePath = Bundle.main.path(forResource: Consts.fileName, ofType: "json"),
           let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
           let products = try? JSONDecoder().decode([Product].self, from: jsonData) {
                storage = products
        } else {
            print(Consts.errorMessage)
        }
    }
    
    // MARK: - Public methods

    public func nextProduct() -> Product {
        let product = storage[currentIndex]
        currentIndex = (currentIndex + 1) % storage.count
        
        return product
    }
}

private extension ProductFaсtory {
    enum Consts {
        static let fileName: String = "products"
        static let errorMessage: String = "Error with decoding json"
    }
}
