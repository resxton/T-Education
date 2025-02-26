//: [Previous](@previous)

/*:
 ## Задача 4: Средняя оценка.
 
 Есть словарь, в котором ключ - это имя студента, а значение - его оценка на экзамене (может быть nil, если не сдал). Нужно найти и вывести среднюю оценку только для студентов, у которых есть оценка. Если не сдали все, так и вывести.
 
 ```
 let dict1 = ["A": 4, "B": 4, "C": 4]
 Output: 4

 let dict2 = ["A": nil, "B": nil, "C": nil]
 Output: Никто не сдал
 ```
 */

func averageMark(of students: [String: Int?]) -> Int? {
    var sum = 0
    var counter = 0
    
    for mark in students.values {
        guard let mark else { continue }
        sum += mark
        counter += 1
    }
    
    print(sum == 0 ? "Никто не сдал" : sum / counter)
    return (sum == 0 ? nil : sum / counter)
}

let dict1: [String: Int?] = ["A": 4, "B": 4, "C": 4]
if let result1 = averageMark(of: dict1) {
    assert(result1 == 4, "Тест 1 не пройден, результат \(result1), ожидалось 4")
}

let dict2: [String: Int?] = ["A": nil, "B": nil, "C": nil]
if let result2 = averageMark(of: dict2) {
    print("Тест 2 не пройден, результат \(result2), ожидалось nil")
}

//: [Next](@next)
