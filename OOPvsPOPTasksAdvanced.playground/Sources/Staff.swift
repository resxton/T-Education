import Foundation

public class Staff: Item {
    // MARK: - Public Properties
    public var id: UUID
    public var weight: Int
    public var attributeBonus: Int
    
    public static let defaultWeight = 1
    public static let defaultAttributeBonus = 1

    // MARK: - Initializers
    public init(weight: Int = Staff.defaultWeight,
                attributeBonus: Int = Staff.defaultAttributeBonus) {
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
