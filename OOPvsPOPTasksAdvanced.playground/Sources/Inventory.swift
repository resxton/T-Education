//
//  Inventory.swift
//  
//
//  Created by Сомов Кирилл on 16.03.2025.
//

import Foundation

public class Inventory: InventoryProtocol {
    // MARK: - Public Properties
    public var storage: [any Item] = []
    public var primaryItem: (any Item)? = nil
    
    // MARK: - Private Properties
    private var totalWeight: Int {
        storage.reduce(0) { $0 + $1.weight }
    }
    
    // MARK: - Public Methods
    public func addItem(_ item: any Item) {
        storage.append(item)
        
        if storage.count == 1 {
            makePrimary(item)
        }
    }
    
    public func removeItem(_ item: any Item) {
        storage.removeAll { $0.id == item.id }
        
        if primaryItem?.id == item.id {
            primaryItem = storage.isEmpty ? nil : storage[0]
        }
    }
    
    public func makePrimary(_ item: any Item) {
        if storage.contains(where: { $0.id == item.id }) {
            primaryItem = item
        } else {
            print("Предмет не найден в инвентаре.")
        }
    }
    
    public func showInventory() {
        guard let primaryItem else {
            print("Инвентарь: \(storage)")
            return
        }
        !storage.isEmpty ? print("Инвентарь: \(storage)\nГлавный предмет: \(primaryItem)") : print("Инвентарь пуст")
    }
}
