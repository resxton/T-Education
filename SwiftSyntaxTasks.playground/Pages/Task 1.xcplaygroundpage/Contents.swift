/*:
 ## Задача 1: Количество уникальных слов.
 
 Дана строка текста, вывести количество уникальных слов в этой строке. Слова разделены пробелами, регистр не учитывается.

 *Подсказка: Обратите внимание на методы работы со строками (split, lowercased) и использование коллекций.*
 
 ```
 let string1 = "apple Orange pineapple PEAR"
 Output: 4

 let string2 = "apple aPPle appLe Apple"
 Output: 1
 ```
 */

func countUniqueWords(in str: String) -> Int {
    let words = str.lowercased().split(separator: " ")
    let wordSet = Set(words)
    
    return wordSet.count
}

let string1 = "apple Orange pineapple PEAR"
let result1 = countUniqueWords(in: string1)
print(result1)
assert(result1 == 4, "Тест 1 не пройден, результат \(result1), ожидалось 4")

let string2 = "apple aPPle appLe Apple"
let result2 = countUniqueWords(in: string2)
print(result2)
assert(result2 == 1, "Тест 2 не пройден, результат \(result2), ожидалось 1")

//: [Next](@next)
