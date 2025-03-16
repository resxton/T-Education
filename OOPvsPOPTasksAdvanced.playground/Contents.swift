import UIKit

// Logging in
let basicCharacter = GameCharacter(name: "Steve", health: 100, level: 12)
let Frieren = Mage(name: "Frieren", health: 1000, level: 100, mana: 100000000, intelligence: 100000000)
let Himmel = Warrior(name: "Himmel", strength: 100000, stamina: 500, health: 10000, level: 80)
let DemonKing = GameCharacter(name: "Demon King", health: 1000000000, level: 101)

// Leveling
basicCharacter.levelUp()
Frieren.levelUp()
Himmel.levelUp()

basicCharacter.printCharacterInfo()
Frieren.printCharacterInfo()
Himmel.printCharacterInfo()

// Attacking
DemonKing.basicAttack(target: basicCharacter)
Himmel.meleeAttack(target: DemonKing)
Himmel.chargedAttack(target: DemonKing)
Frieren.castSpell(on: DemonKing)

// Inventory
let mage = Mage(name: "Test mage", mana: 1, intelligence: 1)

// before staff
mage.inventory.showInventory()
mage.castSpell(on: Himmel) // 1 HP damage
Frieren.healAlly(target: Himmel, amount: 1)

let staff = Staff(weight: 1, attributeBonus: 1)
mage.inventory.addItem(staff)
mage.inventory

// after staff
mage.inventory.showInventory()
mage.castSpell(on: Himmel) // 2 HP damage (attribute bonus worked)
Frieren.healAlly(target: Himmel, amount: 2)

