import Foundation

/*:
 
 # Создадим систему, которая позволит нам хранить информацию о книгах и выполнять действия с ними.
 1. Создайте структуру книги, которая позволит хранить в себе: Название, Автора, Цену, Жанр (сделайте количество жанров ограниченным используя перечисление).
 2. Создайте класс библиотеки. В нем мы будем хранить книги.
 - Добавьте методы:
    - Добавление книги.
    - Фильтрация по жанру.
    - Фильтрация по имени.
 3. Создайте класс пользователя. У него будет имя, скидка в магазине и корзина с книгами.
 - Добавьте методы:
    - Добавление книг в корзину.
    - Подсчет общей стоимости книг в корзине с учетом скидки пользователя.
    - Вывод корзины в отсортированном порядке (сделайте различные варианты сортировки по алфавиту/по цене, используя один метод).
 
 ## Тестирование
 ```swift
 let library = Library()
 library.addBook(
     Book(
         title: "Гарри Поттер и философский камень",
         author: "Дж.К. Роулинг",
         price: 1000,
         genre: .fiction
     )
 )
 library.addBook(
     Book(
         title: "Война и мир",
         author: "Лев Толстой",
         price: 850,
         genre: .novel
     )
 )
 library.addBook(
     Book(
         title: "Стихотворение",
         author: "Владимир Маяковский",
         price: 540,
         genre: .poems
     )
 )

 let user = User(name: "Алиса", discount: 1.5)
 let novelBooks = library.filterBooks(by: .novel)
 user.addToCart(novelBooks)
 let booksWithName = library.filterBooks(byName: "Гарри")
 user.addToCart(booksWithName)

 print("Итоговая корзина: \(user.sortedListOfBooks(by: ...))")
 print("Цена корзины: \(user.totalPrice())")
 
 */
enum Genre: String {
    case fiction = "Фантастика"
    case novel = "Роман"
    case poems = "Поэма"
}

enum SortingType {
    case titleAlphabetical
    case price
}

enum SortingOrder {
    case ascending
    case descending
}

struct Book {
    let title: String
    let author: String
    let price: Double
    let genre: Genre
}

extension Book: CustomStringConvertible {
    var description: String {
        "(\(title), автор: \(author), стоимость: \(price), жанр: \(genre.rawValue))"
    }
}

final class Library {
    // MARK: - Private Properties
    private var storage: [Book] = []
    
    // MARK: - Public Methods
    func addBook(_ book: Book) {
        storage.append(book)
    }
    
    func filterBooks(by genre: Genre) -> [Book] {
        storage.filter { $0.genre == genre }
    }
    
    func filterBooks(byName: String) -> [Book] {
        storage.filter { $0.title.lowercased().contains(byName.lowercased()) }
    }
}

final class User {
    // MARK: - Private Properties
    private let name: String
    private let discount: Double
    private var cart: [Book] = []
    
    // MARK: - Initializers
    init(name: String, discount: Double, cart: [Book] = []) {
        self.name = name
        self.discount = discount
        self.cart = cart
    }
    
    // MARK: - Public Methods
    func addToCart(_ books: [Book]) {
        cart.append(contentsOf: books)
    }
    
    func totalPrice() -> Double {
        cart.reduce(0) { $0 + $1.price } * (1 - discount / 100)
    }
    
    func sortedListOfBooks(by type: SortingType, order: SortingOrder) -> [Book] {
        return cart.sorted { lhs, rhs in
            let comparison: Bool
            switch type {
            case .titleAlphabetical:
                comparison = lhs.title.lowercased() < rhs.title.lowercased()
            case .price:
                comparison = lhs.price < rhs.price
            }
            return order == .ascending ? comparison : !comparison
        }
    }
}

// Тестирование

let library = Library()
library.addBook(
    Book(
        title: "Гарри Поттер и философский камень",
        author: "Дж.К. Роулинг",
        price: 1000,
        genre: .fiction
    )
)
library.addBook(
    Book(
        title: "Война и мир",
        author: "Лев Толстой",
        price: 850,
        genre: .novel
    )
)
library.addBook(
    Book(
        title: "Стихотворение",
        author: "Владимир Маяковский",
        price: 540,
        genre: .poems
    )
)

let user = User(name: "Алиса", discount: 1.5)
let novelBooks = library.filterBooks(by: .novel)
user.addToCart(novelBooks)
let booksWithName = library.filterBooks(byName: "Гарри")
user.addToCart(booksWithName)

print("Итоговая корзина: \(user.sortedListOfBooks(by: .titleAlphabetical, order: .ascending))")
// print("Итоговая корзина: \(user.sortedListOfBooks(by: .priceDescending))")

print("Цена корзины: \(user.totalPrice())")

