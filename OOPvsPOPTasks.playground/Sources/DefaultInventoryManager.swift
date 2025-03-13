//
//  DefaultInventoryManager.swift
//  
//
//  Created by Сомов Кирилл on 13.03.2025.
//


public class DefaultInventoryManager: InventoryManager {
    // MARK: - Public Properties
    public var inventory: [Item] = []
    
    // MARK: - Public Methods
    public func addItem(_ item: Item) {
        inventory.append(item)
        print("🫴 Item added: \(item)")
    }

    public func removeItem(_ item: Item) {
        inventory.removeAll { $0.id == item.id }
        print("🫳 Item removed: \(item)")
    }
    
    public func showInventory() {
        print("Inventory: ", terminator: " ")
        inventory.forEach {
            print($0, terminator: " ")
        }
        print()
    }
}
