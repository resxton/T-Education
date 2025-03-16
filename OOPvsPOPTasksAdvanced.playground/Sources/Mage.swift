//
//  Mage.swift
//  
//
//  Created by Сомов Кирилл on 16.03.2025.
//

public class Mage: GameCharacter {
    // MARK: - Private Properties
    private var mana: Int
    private var intelligence: Int
    
    // MARK: - Initializers
    public init(name: String, health: Int = 10, level: Int = 1, mana: Int, intelligence: Int) {
        self.mana = mana
        self.intelligence = intelligence
        
        super.init(name: name, health: health, level: level)
    }
    
    // MARK: - Public Methods
    public func castSpell(on target: GameCharacter) {
        let damageAmount = 
    }
}
