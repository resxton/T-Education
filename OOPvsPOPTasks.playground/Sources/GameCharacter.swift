//
//  GameCharacter.swift
//  
//
//  Created by Сомов Кирилл on 13.03.2025.
//

import UIKit

public class GameCharacter {
    // MARK: - Public Properties
    public var name: String
    public var inventoryManager: InventoryManager?
    
    // MARK: - Private Properties
    private var health: Int {
        didSet {
            if oldValue <= health {
                print("❤️‍🩹 Healing completed to \(name): \(oldValue) -> \(health)")
            } else {
                print("💥 Damage dealt to \(name): \(oldValue) -> \(health)")
            }
        }
    }
    private var level: Int {
        didSet {
            print("⬆️ \(name) leveled up: \(oldValue) -> \(level)")
        }
    }
    
    // MARK: - Initializers
    public init(name: String, health: Int = 10, level: Int = 1) {
        inventoryManager = DefaultInventoryManager()
        self.name = name
        self.health = health
        self.level = level
    }
    
    // MARK: - Public Methods
    public func takeDamage(amount: Int) {
        guard health > 0 else {
            print("🚫 What's dead can't die.")
            return
        }
        
        guard amount < health else {
            health = 0
            print("💀 \(name) was killed")
            return
        }
        
        guard amount >= 0 else {
            print("🚫 Negative damage impossible")
            return
        }
        
        health -= amount
    }
    
    public func heal(amount: Int) {
        guard amount >= 0 else {
            print("🚫 Negative healing impossible")
            return
        }
        
        health += amount
    }
    
    public func levelUp() {
        level += 1
    }
    
    public func basicAttack(target: GameCharacter) {
        guard isAlive else {
            print("🚫 \(name) is dead, cant attack")
            return
        }

        target.takeDamage(amount: self.level)
        print("⚔️ Attacked \(target) with basic attack")
    }
}

extension GameCharacter {
    public var isAlive: Bool {
        health > 0 ? true : false
    }
}

extension GameCharacter {
    public func printCharacterInfo() {
        isAlive ? print("ℹ️ Alive character with name \(name), health \(health), level \(level)") : print("ℹ️ Dead character with name \(name), health \(health), level \(level)")
    }
}

extension GameCharacter: CustomStringConvertible {
    public var description: String {
        return isAlive ? "character with \(name), health \(health), level \(level)" : "character with name \(name), health \(health), level \(level)"
    }
}
