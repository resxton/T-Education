import Foundation

struct Product: Decodable {
    let name: String
    let brand: String
    let fullPrice: Int
    let priceWithDiscount: Int
    let imageName: String
}
