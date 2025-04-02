//
//  main.swift
//  ARCTesting
//
//  Created by Сомов Кирилл on 24.03.2025.
//

import Foundation

let firstDog = Dog()
let firstCat = Cat()
let secondDog = Dog()

let animals: [Animal] = [firstDog, firstCat, secondDog]

for animal in animals {
    animal.speak()
}

// Для всех объектов будет использоваться Virtual Table Dispatch:
// Animal -> [speak() -> Animal.speak()]
// Dog -> [speak() -> Dog.speak()]
// Cat -> [speak() -> Cat.speak()]

// 1: Woof!, объект Dog, в Virtual Table класса Dog будет найден метод speak()
// 2: Meow!, объект Cat, в Virtual Table класса Cat будет найден метод speak()
// 3: Woof!, объект Dog, в Virtual Table класса Dog будет найден метод speak()
