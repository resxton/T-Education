//
//  Crosier.swift
//  
//
//  Created by Сомов Кирилл on 13.03.2025.
//

import Foundation

public class Crosier {
    // MARK: - Public Properties
    public var id: UUID
    public var weight: Int
    public var durability: Int {
        didSet {
            if oldValue > durability {
                print("ℹ️ Shattered crosier: \(oldValue) -> \(durability)")
            } else {
                print("ℹ️ Fixed crosier: \(oldValue) -> \(durability)")
            }
        }
    }
    public var manaBonus: Int
    
    // MARK: - Initializers
    public init(weight: Int, durability: Int, manaBonus: Int) {
        self.id = UUID()
        self.weight = weight
        self.durability = durability
        self.manaBonus = manaBonus
    }
    
    // MARK: - Public Methods
    public func blessingFromTheHighMagician() {
        manaBonus += 10000
    }
}

extension Crosier: Item {
    public func fix() {
        print("✨ fixing crosier")
        durability = min(durability + 1, 100)
    }
    
    public func shatter() {
        guard durability > 0 else {
            print("🚫 Crosier is already broken")
            return
        }
        
        print("💥 shattering")
        
        guard durability > 1 else {
            durability = 0
            print("💥 Crosier was broken")
            return
        }
        
        durability -= 1
    }
}

extension Crosier: CustomStringConvertible {
    public var description: String {
        "ℹ️ Crosier with weight \(weight), durability \(durability) and mana bonus \(manaBonus)"
    }
}
