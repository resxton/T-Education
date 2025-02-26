
/*:
 ## Задача 5: Математические операции.
 
 Создать перечисление математических операций над одним или двумя числами (сложение, деление, умножение, вычитание, квадрат числа, корень и другие, какие вы хотите). Минимум 5 различных операций.
 И дан массив, который состоит из математической операции и числами, над которым операция выполняется. Вывести результат всех операций.
 
 *Подсказка: Используйте enum с ассоциативными значениями.*
 
 ```
 let array1 = [.sum(1, 2), .square(2)]
 Output:
 Сумма - 3
 Квадрат - 4
 ```
 */

import Foundation

enum MathematicalOperations {
    case addition(Int, Int)
    case subtraction(Int, Int)
    case multiplication(Int, Int)
    case division(Int, Int)
    case remainder(Int, Int)
    case power(Int, Int)
    case sqrt(Int)
    case ln(Int)
    case exp(Int)
    case abs(Int)
}

func performOperations(_ operations: [MathematicalOperations]) {
    for operation in operations {
        switch operation {
        case .addition(let lhs, let rhs):
            print("Сложение – \(lhs + rhs)")
        case .subtraction(let lhs, let rhs):
            print("Вычитание – \(lhs - rhs)")
        case .multiplication(let lhs, let rhs):
            print("Умножение – \(lhs * rhs)")
        case .division(let lhs, let rhs):
            if rhs != 0 {
                print("Деление – \(Double(lhs) / Double(rhs))")
            } else {
                print("Деление – знаменатель равен нулю, результат не определен")
            }
        case .remainder(let lhs, let rhs):
            if rhs != 0 {
                print("Остаток от деления – \(lhs % rhs)")
            } else {
                print("Остаток от деления – знаменатель равен нулю, результат не определен")
            }
        case .power(let base, let power):
            print("Возведение в степень – \(Int(pow(Float(base), Float(power))))")
        case .sqrt(let arg):
            print("Квадратный корень – \(sqrt(Double(arg)))")
        case .ln(let arg):
            print("Натуральный логарифм – \(log(Double(arg)))")
        case .exp(let arg):
            print("Экспонента – \(exp(Float(arg)))")
        case .abs(let arg):
            print("Модуль – \(abs(arg))")
        }
    }
}

let array1: [MathematicalOperations] = [.addition(1, 2), .power(2, 2)]
print("Тест 1")
performOperations(array1)

let array2: [MathematicalOperations] = [.ln(3), .division(1, 0), .power(10, 3), .remainder(52, 19), .exp(8), .abs(-1)]
print("Тест 2")
performOperations(array2)

//: [Next](@next)
