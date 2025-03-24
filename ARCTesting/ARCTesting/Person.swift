//
//  Person.swift
//  ARCTesting
//
//  Created by Сомов Кирилл on 24.03.2025.
//

import Foundation

class Person {
    var name: String
    var car: Car
    
    init(name: String, carModel: String) {
        self.name = name
        self.car = Car(model: carModel)
        self.car.owner = self
    }
    
    deinit {
        print("Person \(name) was destroyed")
    }
}

extension Person: CustomStringConvertible {
    var description: String {
        "Person \(name) with car \(car.model)"
    }
}
