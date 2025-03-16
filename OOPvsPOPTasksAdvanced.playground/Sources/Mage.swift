//
//  Mage.swift
//  
//
//  Created by Сомов Кирилл on 16.03.2025.
//

import Foundation

public class Mage: GameCharacter {
    // MARK: - Public Properties
    public var mana: Int
    public var intelligence: Int
    
    // MARK: - Private Properties
    private var weaponBonus: Int {
        if let staff = inventory.primaryItem as? Staff {
            return staff.attributeBonus
        }
        return 0
    }
    
    // MARK: - Initializers
    public init(name: String, health: Int = 10, level: Int = 1, mana: Int, intelligence: Int) {
        self.mana = mana
        self.intelligence = intelligence
        
        super.init(name: name, health: health, level: level)
    }
    
    
    // MARK: - Public Methods
    public func castSpell(on target: GameCharacter) {
        performAction {
            if intelligence > 10000 {
                target.takeDamage(amount: Int.max)
                print("🔮 \(name) attacked \(target.name) with a zoltraak")
            } else {
                target.takeDamage(amount: intelligence + weaponBonus)
                print("💫 \(name) attacked \(target.name) with a common attacking spell")
            }
        }
    }
    
    public func healAlly(target: GameCharacter, amount: Int) {
        performAction {
            target.heal(amount: amount)
        }
    }
}

extension Mage: ManaHolder {
    public func manaLeak(amount: Int) {
        guard amount > 0 else {
            print("[Mage.manaLeak] – mana leak amount must be positive")
            return
        }
    }
}
