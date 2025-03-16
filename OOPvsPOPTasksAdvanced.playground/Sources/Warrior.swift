//
//  Warrior.swift
//  
//
//  Created by Сомов Кирилл on 16.03.2025.
//

import Foundation

public class Warrior: GameCharacter {
    // MARK: - Public Properties
    public var strength: Int
    
    // MARK: - Private Properties
    private var stamina: Int
    private var weaponBonus: Int {
        if let sword = inventory.primaryItem as? Sword {
            return sword.attributeBonus
        }
        return 0
    }
    
    // MARK: - Initializers
    public init(name: String, strength: Int, stamina: Int, health: Int = 10, level: Int = 1) {
        self.strength = strength
        self.stamina = stamina
        
        super.init(name: name, health: health, level: level)
    }
    
    // MARK: - Public Methods
    public func chargedAttack(target: GameCharacter) {
        performAction {
            guard stamina >= 10 else {
                print("[Warrior.chargedAttack] – stamina must be at least 10 to perform charged attack")
                return
            }
            
            target.takeDamage(amount: level + strength + weaponBonus)
            stamina -= 10
            print("🗡️ \(name) attacked \(target.name) with charged attack")
        }
    }
}

extension Warrior: Melee {
    public func meleeAttack(target: GameCharacter) {
        performAction {
            guard stamina > 0 else {
                print("[Warrior.meleeAttack] – stamina must be positive to perform melee attack")
                return
            }
            
            target.takeDamage(amount: level)
            stamina -= 1
            print("🗡️ \(name) attacked \(target.name) with melee attack")
        }
    }
}
