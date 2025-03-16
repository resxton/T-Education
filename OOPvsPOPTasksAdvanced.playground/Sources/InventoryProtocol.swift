//
//  InventoryProtocol.swift
//  
//
//  Created by Сомов Кирилл on 16.03.2025.
//

public protocol InventoryProtocol {
    var storage: [Item] { get }
    var primaryItem: Item? { get set }
    func addItem(_ item: Item)
    func removeItem(_ item: Item)
    func makePrimary(_ item: Item)
}
