//
//  Car.swift
//  ARCTesting
//
//  Created by Сомов Кирилл on 24.03.2025.
//

import Foundation

final class Car {
    private let model: String
    var owner: Person?
    
    init(model: String) {
        self.model = model
    }
    
    func getModel() -> String {
        model
    }
    
    deinit {
        print("Car \(model) was destroyed")
    }
}

extension Car: CustomStringConvertible {
    var description: String {
        "Car \(model) with owner \(owner?.getName() ?? "")"
    }
}
