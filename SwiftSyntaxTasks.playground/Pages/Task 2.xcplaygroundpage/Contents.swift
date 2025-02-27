//: [Previous](@previous)
/*:
 ## Задача 2: Сбалансированные скобки.
 
 Дана строка, состоящая только из круглых скобок. Проверить является ли последовательность скобок корректной и вывести результат в консоль.

 ```
 let string1 = "(())"
 Output: Корректная

 let string2 = "))(("
 Output: Некорректная

 let string3 = "()()()"
 Output: Корректная
 ```
 */

func isBalancedParentheses(in str: String) -> Bool {
    var stack: [Character] = []
    
    for character in str {
        switch character {
        case "(":
            stack.append(character)
        case ")" where !stack.isEmpty:
            stack.popLast()
        default:
            print("Некорректная")
            return false
        }
    }
    
    print(stack.isEmpty ? "Корректная" : "Некорректная")
    return stack.isEmpty
}


let string1 = "(())"
let result1 = isBalancedParentheses(in: string1)
assert(result1 == true, "Тест 1 не пройден, результат \(result1), ожидалось true")

let string2 = "))(("
let result2 = isBalancedParentheses(in: string2)
assert(result2 == false, "Тест 2 не пройден, результат \(result2), ожидалось false")

let string3 = "()()()"
let result3 = isBalancedParentheses(in: string3)
assert(result3 == true, "Тест 3 не пройден, результат \(result3), ожидалось true")

//: [Next](@next)
