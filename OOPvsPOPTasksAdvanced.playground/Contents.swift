import UIKit

// Logging in
let basicCharacter = GameCharacter(name: "Steve", health: 100, level: 12)
let frieren = Mage(name: "frieren", mana: 1000, intelligence: 100, health: 100000000, level: 100000000)
let himmel = Warrior(name: "himmel", strength: 100000, stamina: 500, health: 10000, level: 80)
let demonKing = GameCharacter(name: "Demon King", health: 1000000000, level: 101)

basicCharacter.printCharacterInfo()
frieren.printCharacterInfo()
himmel.printCharacterInfo()

// Leveling
print("\n--- Leveling ---")
basicCharacter.levelUp()
frieren.levelUp()
himmel.levelUp()

basicCharacter.printCharacterInfo()
frieren.printCharacterInfo()
himmel.printCharacterInfo()

// Attacking
print("\n--- Attacking ---")
demonKing.basicAttack(target: basicCharacter)
himmel.meleeAttack(target: demonKing)
himmel.chargedAttack(target: demonKing)
frieren.castSpell(on: demonKing)

// Inventory testing
print("\n--- Inventory testing ---")
let mage = Mage(name: "Test mage", mana: 1, intelligence: 1)

// before staff
mage.inventory.showInventory()
mage.castSpell(on: himmel) // 1 HP damage
frieren.healAlly(target: himmel, amount: 1)

print("\n--- Working bonus testing ---")
let staff = Staff(weight: 1, attributeBonus: 1)
mage.inventory.addItem(staff)

// after staff
mage.inventory.showInventory()
mage.castSpell(on: himmel) // 2 HP damage (attribute bonus worked)
frieren.healAlly(target: himmel, amount: 2)

print("\n--- Non-working bonus testing ---")
let sword = Sword(weight: 1, attributeBonus: 1)
mage.inventory.addItem(sword)
mage.inventory.makePrimary(sword)

// after sword
mage.inventory.showInventory()
mage.castSpell(on: himmel) // 1 HP damage (attribute bonus didnt work)
frieren.healAlly(target: himmel, amount: 1)
