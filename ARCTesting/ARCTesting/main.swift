//
//  main.swift
//  ARCTesting
//
//  Created by Сомов Кирилл on 24.03.2025.
//

import Foundation

var badPerson: Person? = Person(name: "ARCeniy", carModel: "Strongy")
var carOfBadPerson: Car? = badPerson?.getCar()

print("Non-fixed retain cycle")
print(badPerson ?? "", carOfBadPerson ?? "", separator: "\n")

badPerson = nil
carOfBadPerson = nil // Не происходит очищения

var goodPerson: FixedPerson? = FixedPerson(name: "Da(nil)?", carModel: "Weaky")
var carOfGoodPerson: FixedCar? = goodPerson?.getCar()

print("\nFixed retain cycle")
print(goodPerson ?? "", carOfGoodPerson ?? "", separator: "\n")

goodPerson = nil
carOfGoodPerson  = nil // Происходит очищение
