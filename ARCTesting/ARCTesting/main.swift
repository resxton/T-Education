//
//  main.swift
//  ARCTesting
//
//  Created by Сомов Кирилл on 24.03.2025.
//

import Foundation

var badPerson: Person? = Person(name: "ARCeniy", carModel: "Strongy")
var carOfBadPerson: Car? = badPerson?.car

print("Non-fixed retain cycle")
print(badPerson ?? "", carOfBadPerson ?? "", separator: "\n")

badPerson = nil
carOfBadPerson = nil // Не происходит очищения

var goodPerson: FixedPerson? = FixedPerson(name: "NonArceniy", carModel: "Weaky")
var carOfGoodPerson: FixedCar? = goodPerson?.car

print("\nFixed retain cycle")
print(goodPerson ?? "", carOfGoodPerson ?? "", separator: "\n")

goodPerson = nil
carOfGoodPerson  = nil // Происходит очищение
