import Foundation

public final class Staff: InventoryItemProtocol {
    // MARK: - Public Properties
    public var id: UUID
    public var weight: Int
    public var attributeBonus: Int

    // MARK: - Initializers
    public init(
        weight: Int = InventoryItemConst.defaultWeight.rawValue,
        attributeBonus: Int = InventoryItemConst.defaultAttributeBonus.rawValue
    ) {
        self.id = UUID()
        self.weight = weight
        self.attributeBonus = attributeBonus
    }
}

extension Staff: CustomStringConvertible {
    public var description: String {
        "(ℹ️ Staff with weight \(weight) and attribute bonus \(attributeBonus))"
    }
}
