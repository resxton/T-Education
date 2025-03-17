import UIKit

// Logging in
let basicCharacter = GameCharacter(name: "Steve", health: 100, level: 12)
let Frieren = Mage(name: "Frieren", mana: 1000, intelligence: 100, health: 100000000, level: 100000000)
let Himmel = Warrior(name: "Himmel", strength: 100000, stamina: 500, health: 10000, level: 80)
let DemonKing = GameCharacter(name: "Demon King", health: 1000000000, level: 101)

// Leveling
print("\n--- Leveling ---")
basicCharacter.levelUp()
Frieren.levelUp()
Himmel.levelUp()

basicCharacter.printCharacterInfo()
Frieren.printCharacterInfo()
Himmel.printCharacterInfo()

// Attacking
print("\n--- Attacking ---")
DemonKing.basicAttack(target: basicCharacter)
Himmel.meleeAttack(target: DemonKing)
Himmel.chargedAttack(target: DemonKing)
Frieren.castSpell(on: DemonKing)

// Inventory testing
print("\n--- Inventory testing ---")
let mage = Mage(name: "Test mage", mana: 1, intelligence: 1)

// before staff
mage.inventory.showInventory()
mage.castSpell(on: Himmel) // 1 HP damage
Frieren.healAlly(target: Himmel, amount: 1)

print("\n--- Working bonus testing ---")
let staff = Staff(weight: 1, attributeBonus: 1)
mage.inventory.addItem(staff)

// after staff
mage.inventory.showInventory()
mage.castSpell(on: Himmel) // 2 HP damage (attribute bonus worked)
Frieren.healAlly(target: Himmel, amount: 2)

print("\n--- Non-working bonus testing ---")
let sword = Sword(weight: 1, attributeBonus: 1)
mage.inventory.addItem(sword)
mage.inventory.makePrimary(sword)

// after sword
mage.inventory.showInventory()
mage.castSpell(on: Himmel) // 1 HP damage (attribute bonus didnt work)
Frieren.healAlly(target: Himmel, amount: 1)
