//
//  Sword.swift
//  
//
//  Created by Сомов Кирилл on 16.03.2025.
//

import Foundation

public class Sword: Item {
    // MARK: - Public Properties
    public var id: UUID
    public var weight: Int
    public var attributeBonus: Int
    
    public static let defaultWeight = 1
    public static let defaultAttributeBonus = 1
    
    // MARK: - Initializers
    public init(weight: Int = Sword.defaultWeight,
                attributeBonus: Int = Sword.defaultAttributeBonus) {
            self.id = UUID()
            self.weight = weight
            self.attributeBonus = attributeBonus
        }
}

extension Sword: CustomStringConvertible {
    public var description: String {
        "(ℹ️ Sword with weight \(weight) and attribute bonus \(attributeBonus))"
    }
}
