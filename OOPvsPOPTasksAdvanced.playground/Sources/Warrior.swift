import Foundation

private enum WarriorConst: Int {
    case chargedAttackStaminaCost = 10
    case meleeAttackStrengthTreshold = 5
    case defaultManaLeakFromMeleeAttack = 1
}

public final class Warrior: GameCharacter {
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
    public init(name: String,
                strength: Int,
                stamina: Int,
                health: Int = GCConst.defaultHealth.rawValue,
                level: Int = GCConst.defaultLevel.rawValue) {
        self.strength = strength
        self.stamina = stamina
        
        super.init(name: name, health: health, level: level)
    }
    
    // MARK: - Public Methods
    public func chargedAttack(target: GameCharacter) {
        performAction {
            guard stamina >= WarriorConst.chargedAttackStaminaCost.rawValue else {
                print("[Warrior.chargedAttack] – stamina must be at least \(WarriorConst.chargedAttackStaminaCost.rawValue) to perform charged attack")
                return
            }
            
            print("🗡️ \(name) attacked \(target.name) with charged attack")
            target.takeDamage(amount: currentLevel() + strength + weaponBonus)
            stamina -= WarriorConst.chargedAttackStaminaCost.rawValue
        }
    }
}

extension Warrior: Melee {
    public func meleeAttack(target: GameCharacter) {
        performAction {
            guard strength >= WarriorConst.meleeAttackStrengthTreshold.rawValue else {
                print("[Warrior.meleeAttack] – strength must be at least \(WarriorConst.meleeAttackStrengthTreshold.rawValue) to perform melee attack")
                return
            }
            print("🗡️ \(name) attacked \(target.name) with melee attack")
            guard let manaHolder = target as? ManaHolder else {
                return
            }
            manaHolder.manaLeak(amount: WarriorConst.defaultManaLeakFromMeleeAttack.rawValue) // Немного вариативности)
            target.takeDamage(amount: currentLevel() + strength)
        }
    }
}
