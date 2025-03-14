//
//  AntiMage.swift
//  
//
//  Created by Сомов Кирилл on 13.03.2025.
//


public class AntiMage: GameCharacter {
    // MARK: - Public Properties
    public var radianceOwner: Bool
    
    // MARK: - Private Properties
    private var agility: Int
    
    // MARK: - Initializers
    public init(name: String, health: Int = 10, level: Int = 1, agility: Int = 10, radianceOwner: Bool = false) {
        self.agility = agility
        self.radianceOwner = radianceOwner
        
        super.init(name: name, health: health, level: level)
    }
    
    // MARK: - Overrides
    override public func basicAttack(target: GameCharacter) {
        guard isAlive else {
            print("🚫 \(name) is dead, cant attack")
            return
        }

        target.takeDamage(amount: 1)
        radianceOwner ? print("🗡️ \(name) attacked \(target) with radiance") : print("🗡️ \(name) attacked \(target) without radiance")
    }
    
    // MARK: - Public Methods
    public func castCounterspell(target: ManaHolder, with radius: Int, willTake manaAmount: Int) {
        guard isAlive else {
            print("🚫 \(name) is dead, cant attack")
            return
        }

        target.manaLeak(amount: manaAmount)
        print("🌀 \(name) attacked \(target) with \(radius) m and take \(manaAmount) mana from them")
    }
}

extension AntiMage: NotSoIntelligent {
    public func buyRadiance() {
        guard isAlive else {
            print("🚫 \(name) is dead, cant buy radiance")
            return
        }
        
        self.inventoryManager?.addItem(Radiance(weight: 1000, durability: 100, skillBonus: 1))

        self.radianceOwner = true
        print("Oh, it's a good thing my team doesn't know...")
    }
}
