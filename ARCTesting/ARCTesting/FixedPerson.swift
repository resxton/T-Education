//
//  File.swift
//  ARCTesting
//
//  Created by Сомов Кирилл on 24.03.2025.
//

import Foundation

final class FixedPerson {
    private let name: String
    private let car: FixedCar
    
    init(name: String, carModel: String) {
        self.name = name
        self.car = FixedCar(model: carModel)
        self.car.owner = self
    }
    
    func getName() -> String {
        name
    }
    
    func getCar() -> FixedCar {
        car
    }
    
    deinit {
        print("Person \(name) was destroyed")
    }
}

extension FixedPerson: CustomStringConvertible {
    var description: String {
        "Person \(name) with car \(car.getModel())"
    }
}
