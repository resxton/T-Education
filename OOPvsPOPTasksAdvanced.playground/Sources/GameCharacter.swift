public class GameCharacter {
    // MARK: - Public Properties
    public var name: String
    public var level: Int
    public var health: Int {
        didSet {
            handleHealthChange(oldValue: oldValue)
        }
    }
    
    public var inventory: InventoryProtocol
    
    // MARK: - Private Properties
    public static let oneShotLevelThreshold = 100
    public static let defaultHealth = 10
    public static let defaultLevel = 1
    
    // MARK: - Initializers
    public init(name: String,
                health: Int = 10,
                level: Int = 1) {
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
    }
    
    public func heal(amount: Int) {
        guard amount > 0 else {
            print("[GameCharacter.heal] – healing amount must be at least 1")
            return
        }
        
        health += amount
    }
    
    public func levelUp() {
        level += 1
    }
    
    public func basicAttack(target: GameCharacter) {
        performAction {
            let damage = level > GameCharacter.oneShotLevelThreshold ? Int.max : level
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
    
    // MARK: - Private Methods
    private func handleHealthChange(oldValue: Int) {
        if oldValue > health && health > 0 {
            print("\(name) was damaged: \(oldValue) HP -> \(health) HP (-\(oldValue - health) HP)")
        } else if health == 0 {
            print("\(name) was killed: \(oldValue) HP -> \(health) HP")
        } else {
            print("\(name) was healed: \(oldValue) HP -> \(health) HP (+\(health - oldValue) HP)")
        }
    }
}

extension GameCharacter {
    public var isAlive: Bool {
        health > 0
    }
    
    public func printCharacterInfo() {
        print(isAlive ? "ℹ️ Alive character with name \(name), health \(health), level \(level)" : "ℹ️ Dead character with name \(name), health \(health), level \(level)")
    }
}
