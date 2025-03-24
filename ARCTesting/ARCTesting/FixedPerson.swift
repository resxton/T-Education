//
//  File.swift
//  ARCTesting
//
//  Created by Сомов Кирилл on 24.03.2025.
//

import Foundation

class FixedPerson {
    var name: String
    var car: FixedCar
    
    init(name: String, carModel: String) {
        self.name = name
        self.car = FixedCar(model: carModel)
        self.car.owner = self
    }
    
    deinit {
        print("Person \(name) was destroyed")
    }
}

extension FixedPerson: CustomStringConvertible {
    var description: String {
        "Person \(name) with car \(car.model)"
    }
}
