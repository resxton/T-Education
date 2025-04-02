//
//  Person.swift
//  ARCTesting
//
//  Created by Сомов Кирилл on 24.03.2025.
//

import Foundation

final class Person {
    private let name: String
    private let car: Car
    
    init(name: String, carModel: String) {
        self.name = name
        self.car = Car(model: carModel)
        self.car.owner = self
    }
    
    func getName() -> String {
        name
    }
    
    func getCar() -> Car {
        car
    }
    
    deinit {
        print("Person \(name) was destroyed")
    }
}

extension Person: CustomStringConvertible {
    var description: String {
        "Person \(name) with car \(car.getModel())"
    }
}
