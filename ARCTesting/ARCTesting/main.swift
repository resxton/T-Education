//
//  main.swift
//  ARCTesting
//
//  Created by Сомов Кирилл on 24.03.2025.
//

import Foundation

var badPerson: Person? = Person(name: "ARCeniy", carModel: "WeakLa")
var carOfBadPerson: Car? = badPerson?.car

print(badPerson ?? "", carOfBadPerson ?? "", separator: "\n")

badPerson = nil
carOfBadPerson = nil // Не происходит очищения
