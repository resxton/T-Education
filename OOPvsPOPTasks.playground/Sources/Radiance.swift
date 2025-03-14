//
//  Radiance.swift
//  
//
//  Created by Сомов Кирилл on 13.03.2025.
//

import Foundation

public class Radiance {
    // MARK: - Public Properties
    public var id: UUID
    public var weight: Int
    public var skillBonus: Int
    public var durability: Int {
        didSet {
            if oldValue > durability {
                print("ℹ️ Shattered radiance: \(oldValue) -> \(durability)")
            } else {
                print("ℹ️ Fixed radiance: \(oldValue) -> \(durability)")
            }
        }
    }
    
    // MARK: - Initializers
    public init(weight: Int, durability: Int, skillBonus: Int) {
        self.id = UUID()
        self.weight = weight
        self.durability = durability
        self.skillBonus = skillBonus
    }
    
    // MARK: - Public Methods
    public func blessingFromSerega() {
        skillBonus -= 10000
    }
}

extension Radiance: Item {
    public func fix() {
        print("✨ fixing radiance")
        durability = min(durability + 1, 100)
    }
    
    public func shatter() {
        guard durability > 0 else {
            print("🚫 Radiance is already broken")
            return
        }
        
        print("💥 shattering")
        
        guard durability > 1 else {
            durability = 0
            print("💥 Radiance was broken")
            return
        }
        
        durability -= 1
    }
}

extension Radiance: CustomStringConvertible {
    public var description: String {
        "ℹ️ Radiance with weight \(weight), durability \(durability) and skill bonus \(skillBonus)"
    }
}
