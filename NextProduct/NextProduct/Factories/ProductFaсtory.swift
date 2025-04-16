import Foundation

protocol ProductFactoryProtocol {
    func getProduct() -> Product
}

final class ProductFaсtory: ProductFactoryProtocol {
    
    // MARK: - Private Properties
    
    private let storage: [Product]
    private var currentIndex = 0
    
    // MARK: - Initializers
    
    init() {
        if let filePath = Bundle.main.path(forResource: Consts.fileName, ofType: Consts.fileExtension),
           let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
           let products = try? JSONDecoder().decode([Product].self, from: jsonData) {
                storage = products
        } else {
            storage = []
            print(Consts.errorMessage)
        }
    }
    
    // MARK: - Public methods

    public func getProduct() -> Product {
        let product = storage[currentIndex]
        
        if currentIndex < storage.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
        
        return product
    }
}

// MARK: - ProductFaсtory.Consts

private extension ProductFaсtory {
    enum Consts {
        static let fileName: String = "products"
        static let fileExtension: String = "json"
        static let errorMessage: String = "Error with decoding json"
    }
}
