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
    
    var storage: [Product] = []
    
    init() {
        if let filePath = Bundle.main.path(forResource: Consts.fileName, ofType: "json"),
           let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
           let products = try? JSONDecoder().decode([Product].self, from: jsonData) {
                storage = products
        } else {
            print(Consts.errorMessage)
        }
    }
    
    func nextProduct() -> Product {
        guard let randomProduct = storage.randomElement() else {
            return Product(
                name: "Игрушечная машина Fiat 500",
                brand: "Burago",
                fullPrice: 2499,
                priceWithDiscount: 1499,
                imageName: "Car"
            )
        }
        
        return randomProduct
    }
}

private extension ProductFaсtory {
    enum Consts {
        static let fileName: String = "products"
        static let errorMessage: String = "Erorr with decoding json"
    }
}
