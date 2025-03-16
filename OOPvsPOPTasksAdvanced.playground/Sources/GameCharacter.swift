//
//  GameCharacter.swift
//  
//
//  Created by Сомов Кирилл on 16.03.2025.
//

public class GameCharacter {
    // MARK: - Public Properties
    public var level: Int

    // MARK: - Private Properties
    private var name: String
    private var health: Int {
        didSet {
            if oldValue > health {
                print("\(name) was damaged: \(oldValue) -> \(health)")
            } else {
                print("\(name) was healed: \(oldValue) -> \(health)")
            }
        }
    }
    
    // MARK: - Initializers
    public init(name: String, health: Int = 10, level: Int = 1) {
        self.name = name
        self.health = health
        self.level = level
    }
    
    // MARK: - Public Methods
    public func takeDamage(amount: Int) {
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
}
