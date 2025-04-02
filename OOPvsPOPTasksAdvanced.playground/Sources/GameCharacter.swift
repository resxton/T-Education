import Foundation

public enum GCConst: Int {
    case oneShotLevelThreshold = 100
    case defaultHealth = 10
    case defaultLevel = 1
}

public class GameCharacter {
    // MARK: - Public Properties
    public let name: String
    public var inventory: InventoryProtocol
    
    // MARK: - Private Properties
    private var level: Int
    private var health: Int
    
    // MARK: - Initializers
    public init(
        name: String,
        health: Int = GCConst.defaultHealth.rawValue,
        level: Int = GCConst.defaultLevel.rawValue
    ) {
        inventory = Inventory(owner: name)
        
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
            print("[GameCharacter.takeDamage] – damage amount must be at least 1")
            return
        }
        
        health = max(health - amount, 0)
        if health == 0 {
            print("\(name) was killed")
        } else {
            print("\(name) was damaged by \(amount) HP")
        }
    }
    
    public func heal(amount: Int) {
        guard amount > 0 else {
            print("[GameCharacter.heal] – healing amount must be at least 1")
            return
        }
        
        health += amount
        print("\(name) was healed by \(amount) HP")
    }
    
    public func currentHealth() -> Int {
        health
    }
    
    public func currentLevel() -> Int {
        level
    }
    
    public func levelUp() {
        level += 1
    }
    
    public func basicAttack(target: GameCharacter) {
        performAction {
            // При уровне выше GCConst.oneShotLevelThreshold
            // урон обычной атаки станет летальным для любого противника
            let damage = level > GCConst.oneShotLevelThreshold.rawValue ? target.currentHealth() : level
            print("🗡️ \(name) attacked \(target.name) with basic attack")
            target.takeDamage(amount: damage)
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

public extension GameCharacter {
    var isAlive: Bool {
        health > 0
    }
    
    func printCharacterInfo() {
        print(isAlive ? "ℹ️ Alive character with name \(name), health \(health), level \(level)" : "ℹ️ Dead character with name \(name), health \(health), level \(level)")
    }
}
