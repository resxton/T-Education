//
//  Staff.swift
//  
//
//  Created by Сомов Кирилл on 16.03.2025.
//

import Foundation

public class Staff: Item {
    // MARK: - Public Properties
    public var id: UUID
    public var weight: Int
    public var attributeBonus: Int
    
    // MARK: - Initializers
    public init(weight: Int = 1, attributeBonus: Int = 1) {
        self.id = UUID()
        self.weight = weight
        self.attributeBonus = attributeBonus
    }
}

extension Staff: CustomStringConvertible {
    public var description: String {
        "(ℹ️ Staff with weight \(weight) and attribute bonus \(attributeBonus))"
    }
}
