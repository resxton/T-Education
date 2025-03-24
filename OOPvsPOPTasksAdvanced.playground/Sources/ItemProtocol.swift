//
//  Item.swift
//  
//
//  Created by Сомов Кирилл on 16.03.2025.
//

import Foundation

public enum ItemConst: Int {
    case defaultWeight = 10
    case defaultAttributeBonus = 1
}

public protocol Item {
    var id: UUID { get set }
    var weight: Int { get set }
    var attributeBonus: Int { get set }
}
