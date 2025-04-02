//
//  Inventory.swift
//  
//
//  Created by Сомов Кирилл on 16.03.2025.
//

import Foundation

public final class Inventory: InventoryProtocol {
    // MARK: - Public Properties
    public var storage: [any InventoryItemProtocol] = []
    public var primaryItem: (any InventoryItemProtocol)? = nil
    public var owner: String

    // MARK: - Initializers
    init(owner: String) {
        self.owner = owner
    }
    
    // MARK: - Public Methods
    public func addItem(_ item: any InventoryItemProtocol) {
        storage.append(item)
        
        if storage.count == 1 {
            makePrimary(item)
        }
    }
    
    public func removeItem(_ item: any InventoryItemProtocol) {
        storage.removeAll { $0.id == item.id }
        
        if primaryItem?.id == item.id {
            primaryItem = storage.isEmpty ? nil : storage[0]
        }
    }
    
    public func makePrimary(_ item: any InventoryItemProtocol) {
        if storage.contains(where: { $0.id == item.id }) {
            primaryItem = item
        } else {
            print("No such item.")
        }
    }
    
    public func showInventory() {
        guard let primaryItem else {
            print("Inventory of \(owner): \(storage)")
            return
        }
        !storage.isEmpty ? print("Inventory of \(owner): \(storage)\nPrimary item: \(primaryItem)") : print("Inventory of \(owner) is empty")
    }
}
