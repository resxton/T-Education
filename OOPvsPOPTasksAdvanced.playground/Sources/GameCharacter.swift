//
//  GameCharacter.swift
//  
//
//  Created by Сомов Кирилл on 16.03.2025.
//

public class GameCharacter {
    // MARK: - Public Properties
    public var name: String
    public var level: Int
    public var health: Int {
        didSet {
            if oldValue > health && health > 0 {
                print("\(name) was damaged: \(oldValue) HP -> \(health) HP")
            } else if health == 0 {
                print("\(name) was killed: \(oldValue) HP -> \(health) HP")

            } else {
                print("\(name) was healed: \(oldValue) HP -> \(health) HP")
            }
        }
    }
    
    public var inventory = Inventory()
    
    // MARK: - Initializers
    public init(name: String, health: Int = 10, level: Int = 1) {
        self.name = name
        self.health = health
        self.level = level
    }
    
    // MARK: - Public Methods
    public func takeDamage(amount: Int) {
        guard isAlive else {
            print("[GameCharacter.takeDamage] – \(name) is already dead")
            return
        }
        
        guard amount > 0 else {
            print("[GameCharacter.takeDamage] – damage amount must be positive")
            return
        }
        
        if amount < health {
            health -= amount
        } else {
            health = 0
        }
    }
    
    public func heal(amount: Int) {
        guard amount > 0 else {
            print("[GameCharacter.takeDamage] – healing amount must be positive")
            return
        }
        
        health += amount
    }
    
    public func levelUp() {
        level += 1
    }
    
    public func basicAttack(target: GameCharacter) {
        performAction {
            if level > 100 {
                target.takeDamage(amount: Int.max)
            } else {
                target.takeDamage(amount: level)
            }
        }
    }
    
    public func performAction(_ action: () -> Void) {
        guard isAlive else {
            print("\(name) is dead, cant perform any action")
            return
        }
        
        action()
    }
}

extension GameCharacter {
    public var isAlive: Bool {
        health > 0
    }
    
    public func printCharacterInfo() {
        print(isAlive ? "ℹ️ Alive character with name \(name), health \(health), level \(level)" : "ℹ️ Dead character with name \(name), health \(health), level \(level)")
    }
}
