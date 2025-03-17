import Foundation

public class Warrior: GameCharacter {
    // MARK: - Public Properties
    public var strength: Int
    
    // MARK: - Private Properties
    private var stamina: Int
    private static let chargedAttackStaminaCost = 10
    private static let meleeAttackStaminaCost = 1
    
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
                health: Int = GameCharacter.defaultHealth,
                level: Int = GameCharacter.defaultLevel) {
        self.strength = strength
        self.stamina = stamina
        
        super.init(name: name, health: health, level: level)
    }
    
    // MARK: - Public Methods
    public func chargedAttack(target: GameCharacter) {
        performAction {
            guard stamina >= Warrior.chargedAttackStaminaCost else {
                print("[Warrior.chargedAttack] – stamina must be at least \(Warrior.chargedAttackStaminaCost) to perform charged attack")
                return
            }
            
            print("🗡️ \(name) attacked \(target.name) with charged attack")
            target.takeDamage(amount: level + strength + weaponBonus)
            stamina -= Warrior.chargedAttackStaminaCost
        }
    }
}

extension Warrior: Melee {
    public func meleeAttack(target: GameCharacter) {
        performAction {
            guard stamina >= Warrior.meleeAttackStaminaCost else {
                print("[Warrior.meleeAttack] – stamina must be at least \(Warrior.meleeAttackStaminaCost) to perform melee attack")
                return
            }
            
            print("🗡️ \(name) attacked \(target.name) with melee attack")
            target.takeDamage(amount: level)
            stamina -= Warrior.meleeAttackStaminaCost
        }
    }
}
