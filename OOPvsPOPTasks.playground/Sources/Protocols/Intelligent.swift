//
//  Intelligent.swift
//  
//
//  Created by Сомов Кирилл on 13.03.2025.
//


public protocol Intelligent {
    var intelligence: Int { get set }
    func diplomaticConflictResolution(target: GameCharacter)
}
