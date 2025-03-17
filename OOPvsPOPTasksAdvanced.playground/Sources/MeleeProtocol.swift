//
//  Melee.swift
//  
//
//  Created by Сомов Кирилл on 16.03.2025.
//

public protocol Melee {
    var strength: Int { get set }
    func meleeAttack(target: GameCharacter)
}
