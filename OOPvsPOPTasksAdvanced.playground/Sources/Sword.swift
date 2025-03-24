//
//  Sword.swift
//  
//
//  Created by Сомов Кирилл on 16.03.2025.
//

import Foundation

public final class Sword: InventoryItemProtocol {
    // MARK: - Public Properties
    public var id: UUID
    public var weight: Int
    public var attributeBonus: Int
    
    // MARK: - Initializers
    public init(weight: Int = ItemConst.defaultWeight.rawValue,
                attributeBonus: Int = ItemConst.defaultAttributeBonus.rawValue) {
    public init(weight: Int = ItemConst.defaultWeight.rawValue,
                attributeBonus: Int = ItemConst.defaultAttributeBonus.rawValue) {
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
