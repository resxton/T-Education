//
//  FixedCar.swift
//  ARCTesting
//
//  Created by Сомов Кирилл on 24.03.2025.
//

import Foundation

class FixedCar {
    var model: String
    weak var owner: FixedPerson?
    
    init(model: String) {
        self.model = model
    }
    
    deinit {
        print("Car \(model) was destroyed")
    }
}

extension FixedCar: CustomStringConvertible {
    var description: String {
        "Car \(model) with owner \(owner?.name ?? "")"
    }
}
