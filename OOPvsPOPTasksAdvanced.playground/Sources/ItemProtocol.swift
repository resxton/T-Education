//
//  Item.swift
//  
//
//  Created by Сомов Кирилл on 16.03.2025.
//

import Foundation

public protocol Item {
    var id: UUID { get set }
    var weight: Int { get set }
    var attributeBonus: Int { get set }
}

