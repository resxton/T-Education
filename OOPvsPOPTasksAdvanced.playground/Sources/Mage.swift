import Foundation

private enum MageConst: Int {
    case zoltraakThreshold = 10_000
}

public final class Mage: GameCharacter {
    // MARK: - Public Properties
    public var mana: Int
    
    // MARK: - Private Properties
    private var intelligence: Int
    
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
                health: Int = GCConst.defaultHealth.rawValue,
                level: Int = GCConst.defaultLevel.rawValue) {
        self.mana = mana
        self.intelligence = intelligence
        super.init(name: name, health: health, level: level)
    }
    
    // MARK: - Public Methods
    public func castSpell(on target: GameCharacter) {
        performAction {
            // При уровне intelligence выше Mage.zoltraakThreshold
            // вместо обычного заклинания будет применено
            // заклинание Зольтраак, наносящее летальный урон любому противнику
            let damage = intelligence > MageConst.zoltraakThreshold.rawValue ? Int.max : intelligence + weaponBonus
            let spellType = intelligence > MageConst.zoltraakThreshold.rawValue ? "zoltraak" : "common attacking spell"
            print("🔮 \(name) attacked \(target.name) with a \(spellType)")

            target.takeDamage(amount: damage)
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
