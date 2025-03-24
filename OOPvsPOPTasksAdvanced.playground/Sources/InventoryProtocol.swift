//
//  InventoryProtocol.swift
//  
//
//  Created by Сомов Кирилл on 16.03.2025.
//

public protocol InventoryProtocol {
    var storage: [InventoryItemProtocol] { get }
    var owner: String { get set }
    var primaryItem: InventoryItemProtocol? { get set }
    func addItem(_ item: InventoryItemProtocol)
    func removeItem(_ item: InventoryItemProtocol)
    func makePrimary(_ item: InventoryItemProtocol)
    func showInventory()
}
