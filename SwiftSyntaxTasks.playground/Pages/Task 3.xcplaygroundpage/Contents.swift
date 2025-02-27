//: [Previous](@previous)
/*:
 ## Задача 3: Группировка строк.
 
 Дан массив строк. Нужно сгруппировать строки по количеству символов в ней, вывести результат.
 
 *Подсказка: Используйте правильную коллекцию.*
 
 ```
 let array1 = ["a", "bb", "b", "cccc"]
 Output:
 1 - ["a", "b"]
 2 - ["bb"]
 4 - ["cccc"]

 let array2 = ["a", "b", "c"]
 Output:
 1 - ["a", "b", "c"]
 ```
 */

func groupStringsByCount(from arr: [String]) -> [Int: [String]] {
    var groups: [Int: [String]] = [:]
    
    for string in arr {
        groups[string.count, default: []].append(string)
    }
    
    for (key, value) in groups {
        print("\(key) – \(value)")
    }
    
    return groups
}

print("Тест 1")
let array1 = ["a", "bb", "b", "cccc"]
let result1 = groupStringsByCount(from: array1)
assert(result1 == [1: ["a", "b"], 2: ["bb"], 4: ["cccc"]], "Тест 1 не пройден, результат \(result1), ожидалось [1: [\"a\", \"b\"], 2: [\"bb\"], 4: [\"cccc\"]]")

print("Тест 2")
let array2 = ["a", "b", "c"]
let result2 = groupStringsByCount(from: array2)
assert(result2 == [1: ["a", "b", "c"]], "Тест 2 не пройден, результат \(result2), ожидалось [1: [\"a\", \"b\", \"c\"]]")

//: [Next](@next)
