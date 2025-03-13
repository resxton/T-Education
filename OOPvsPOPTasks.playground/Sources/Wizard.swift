//
//  Wizard.swift
//  
//
//  Created by Сомов Кирилл on 13.03.2025.
//


public class Wizard: GameCharacter, ManaHolder {
    // MARK: - Public Properties
    public var intelligence: Int
    public var mana: Int {
        didSet {
            print("ℹ️ Mana stealed from \(name): \(oldValue) -> \(mana)")
        }
    }
    
    // MARK: - Initializers
    public init(name: String, health: Int = 10, level: Int = 1, mana: Int = 10, intelligence: Int = 10) {
        self.mana = mana
        self.intelligence = intelligence
        
        super.init(name: name, health: health, level: level)
    }
    
    // MARK: - Overrides
    override public func basicAttack(target: GameCharacter) {
        guard isAlive else {
            print("🚫 \(name) is dead, cant attack")
            return
        }
        
        if intelligence > 1000 {
            target.takeDamage(amount: Int.max)
            print("🔮 \(name) attacked \(target) with a zoltraak")
        } else {
            target.takeDamage(amount: self.mana)
            print("💫 \(name) attacked \(target) with a ordinary spell")
        }
    }
    
    // MARK: - Public Methods
    public func castFireball(target: GameCharacter, with radius: Int, with temperature: Int = 1000) {
        guard isAlive else {
            print("🚫 \(name) is dead, cant attack")
            return
        }

        target.takeDamage(amount: radius * radius * temperature / 1000)
        print("🔥 \(name) attacked \(target) with a fireball of radius \(radius) m with temperature \(temperature)°C")
    }
    
    public func manaLeak(amount: Int) {
        guard amount < mana else {
            mana = 0
            return
        }
        
        guard amount > 0 else {
            print("🚫 Mana leak cant be negative")
            return
        }
        
        mana -= amount
    }
}

extension Wizard: Intelligent {
    public func diplomaticConflictResolution(target: GameCharacter) {
        guard isAlive else {
            print("🚫 \(name) is dead, cant attack")
            return
        }

        if target.isAlive {
            print("🕊️ Resolved the conflict with \(target) without a fight")
        } else {
            print("🚫 Cannot resolve conflict with a dead (\(target))")
        }
    }
}
