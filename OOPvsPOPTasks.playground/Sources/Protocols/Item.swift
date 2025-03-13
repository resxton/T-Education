//
//  Item.swift
//  
//
//  Created by Сомов Кирилл on 13.03.2025.
//

import Foundation

public protocol Item {
    var id: UUID { get set }
    var weight: Int { get set }
    var durability: Int { get set }
    func fix()
    func shatter()
}
