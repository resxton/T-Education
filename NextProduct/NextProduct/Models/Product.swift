//
//  Product.swift
//  NextProduct
//
//  Created by Сомов Кирилл on 02.04.2025.
//

import Foundation

struct Product: Decodable {
    let name: String
    let brand: String
    let fullPrice: Int
    let priceWithDiscount: Int
    let imageName: String
}
