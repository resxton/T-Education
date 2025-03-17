import Foundation

public class Mage: GameCharacter {
    // MARK: - Public Properties
    public var mana: Int
    public var intelligence: Int
    
    // MARK: - Private Properties
    private static let zoltraakThreshold = 10_000
    
    private var weaponBonus: Int {
        if let staff = inventory.primaryItem as? Staff {
            return staff.attributeBonus
        }
        return 0
    }
    
    // MARK: - Initializers
    public init(name: String,
                mana: Int,
                intelligence: Int,
                health: Int = GameCharacter.defaultHealth,
                level: Int = GameCharacter.defaultLevel) {
        self.mana = mana
        self.intelligence = intelligence
        super.init(name: name, health: health, level: level)
    }
    
    // MARK: - Public Methods
    public func castSpell(on target: GameCharacter) {
        performAction {
            let damage = intelligence > Mage.zoltraakThreshold ? Int.max : intelligence + weaponBonus
            target.takeDamage(amount: damage)
            
            let spellType = intelligence > Mage.zoltraakThreshold ? "zoltraak" : "common attacking spell"
            print("🔮 \(name) attacked \(target.name) with a \(spellType)")
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
            print("[Mage.manaLeak] – mana leak amount must be at least 1")
            return
        }
    }
}
