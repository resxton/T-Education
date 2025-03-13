//
//  InventoryManager.swift
//  
//
//  Created by Сомов Кирилл on 13.03.2025.
//


public protocol InventoryManager {
    var inventory: [Item] { get set }
    func addItem(_ item: Item)
    func removeItem(_ item: Item)
    func showInventory()
}
