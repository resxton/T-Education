import UIKit

/*:
 - Создайте базовый класс ```GameCharacter```:
 
        **Свойства:** ```name``` (```String```), ```health``` (```Int```), ```level``` (```Int```).
 
        **Методы:** takeDamage(amount: Int), heal(amount: Int), levelUp().

 - Создайте ДВА подкласса от ```GameCharacter``` (на выбор, например, ```Warrior```, ```Mage```, ```Archer``` или свои):
    
    **Для каждого подкласса:**
    
    1-2 уникальных свойства (например, ```strength```, ```magicPower```, ```agility```).
    
    1 специфичный метод атаки (например, ```attack(target:)```, ```castSpell(spellName: target:)```, ```shootArrow(target:))```.
    
    Переопределите метод атаки (опционально) для уникальности.

 - Создайте 1 или 2 протокола способностей (на выбор, например, ```Flyable```, ```Healable``` или свои):
    
    **Протокол должен требовать:**
    
    1 свойство (например, ```flightSpeed```),
    
    1 метод (например, ```fly()```).
    
    Сделайте так, чтобы 1 или оба ваших подкласса персонажей соответствовали этим протоколам.

 - Используйте расширения для класса ```GameCharacter```:
    
    Добавьте вычисляемое свойство ```isAlive (Bool, health > 0)```.
    
    Добавьте метод ```printCharacterInfo()``` для вывода информации о персонаже в консоль.

 - Продемонстрируйте работу системы:
    
    Создайте экземпляры персонажей разных типов.
    
    Продемонстрируйте взаимодействие: атаки, лечение (если есть), повышение уровня.
    
    Используйте ```printCharacterInfo()``` для вывода информации о персонажах.

 ### Необязательные задания "для героев":
    
    Реализуйте протокол ```Item``` и 2 типа игровых предметов (инвентарь - упрощенно).
    
    Кратко проанализируйте свой код на соответствие принципам SOLID (SRP и OCP).

 ## Критерии оценки:
 1. Корректность наследования и реализации протоколов (2 балла)
 
 +2: Используется наследование, классы корректно наследуют ```GameCharacter```. Протоколы реализованы правильно.
 
 -1: Если протокол не реализован или реализован некорректно.
 
 -1: Если наследование реализовано неправильно или нарушена логика ООП.
 
 2. Работоспособность системы и логика взаимодействия (1 балла)
 
 +1: Код компилируется, персонажи могут атаковать, лечиться, взаимодействовать.
 
 -1: Логика работы метода атаки или других механик нарушена.
 
 -1: Отсутствует демонстрация работы системы (не созданы экземпляры, нет взаимодействий).
 
 3. Использование расширений (1 балл)
 
 +1: Используется extension для ```isAlive``` и ```printCharacterInfo()```.
 
 -0.5: Если одно из расширений отсутствует или реализовано некорректно.
 
 4. Качество кода (2 балла)
 
 +2: Код чистый, структурированный, удобочитаемый, использованы комментарии.
 
 -1: Присутствует дублирование кода, код запутанный.
 
 -1: Использование "магических чисел" вместо констант.

 5. Соответствие принципам SOLID (SRP, OCP) (2 балла)
 
 +2: Принципы SRP и OCP соблюдены (разные классы отвечают за одну задачу, код расширяем без изменений базового класса).
 
 -1: Если класс ```GameCharacter``` перегружен ответственностями (например, содержит логику инвентаря).
 
 -1: Если код сложно расширять (например, добавление новых персонажей требует изменения базового класса).
 
 6. Реализация необязательной части (1 балл)
 
 +1: Добавлены предметы (реализован протокол Item), персонажи могут использовать инвентарь.
 
 -0.5: Протокол ```Item``` реализован, но логика предметов не используется.
 
 7. Тестирование (1 балл)
 
 +1: Код протестирован (есть примеры создания персонажей и их взаимодействий).
 
 -0.5: Нет демонстрации тестов в коде.
 */
// Создайте базовый класс GameCharacter:
//  Свойства: name (String), health (Int), level (Int).
//  Методы: takeDamage(amount: Int), heal(amount: Int), levelUp().


class GameCharacter {
    // MARK: - Public Properties
    var name: String
    
    // MARK: - Private Properties
    private var health: Int {
        didSet {
            if oldValue <= health {
                print("Healing completed to \(name): \(oldValue) -> \(health)")
            } else {
                print("Damage dealt to \(name): \(oldValue) -> \(health)")
            }
        }
    }
    private var level: Int {
        didSet {
            print("\(name) leveled up: \(oldValue) -> \(level)")
        }
    }
    
    // MARK: - Initializers
    init(name: String, health: Int = 10, level: Int = 1) {
        self.name = name
        self.health = health
        self.level = level
    }
    
    // MARK: - Public Methods
    func takeDamage(amount: Int) {
        guard health > 0 else {
            print("What's dead can't die.")
            return
        }
        
        guard amount <= health else {
            health = 0
            print("\(name) was killed")
            return
        }
        
        guard amount >= 0 else {
            print("Negative damage impossible")
            return
        }
        
        health -= amount
    }
    
    func heal(amount: Int) {
        guard amount >= 0 else {
            print("Negative healing impossible")
            return
        }
        
        health += amount
    }
    
    func levelUp() {
        level += 1
    }
    
    func basicAttack(target: GameCharacter) {
        guard isAlive else {
            print("\(name) is dead, cant attack")
            return
        }

        target.takeDamage(amount: self.level)
        print("Attacked \(target) with basic attack")
    }
}

extension GameCharacter: CustomStringConvertible {
    var description: String {
        return isAlive ? "character with \(name), health \(health), level \(level)" : "character with name \(name), health \(health), level \(level)"
    }
}

//  Создайте ДВА подкласса от GameCharacter (на выбор, например, Warrior, Mage, Archer или свои):
//      Для каждого подкласса:
//          1-2 уникальных свойства (например, strength, magicPower, agility).
//          1 специфичный метод атаки (например, attack(target:), castSpell(spellName: target:), shootArrow(target:)).
//          Переопределите метод атаки (опционально) для уникальности.

class Wizard: GameCharacter {
    // MARK: - Public Properties
    var intelligence: Int
    
    // MARK: - Private Properties
    private var mana: Int
    
    // MARK: - Initializers
    init(name: String, health: Int = 10, level: Int = 1, mana: Int = 10, intelligence: Int = 10) {
        self.mana = mana
        self.intelligence = intelligence
        
        super.init(name: name, health: health, level: level)
    }
    
    // MARK: - Overrides
    override func basicAttack(target: GameCharacter) {
        guard isAlive else {
            print("\(name) is dead, cant attack")
            return
        }
        
        if intelligence > 1000 {
            target.takeDamage(amount: Int.max)
            print("\(name) attacked \(target) with a zoltraak")
        } else {
            target.takeDamage(amount: self.intelligence)
            print("\(name) attacked \(target) with a ordinary spell")
        }
    }
    
    // MARK: - Public Methods
    func castFireball(target: GameCharacter, with radius: Int, with temperature: Int = 1000) {
        guard isAlive else {
            print("\(name) is dead, cant attack")
            return
        }

        target.takeDamage(amount: radius * radius * temperature / 1000)
        print("\(name) attacked \(target) with a fireball of radius \(radius) m with temperature \(temperature)°C")
    }
    
    func manaLeak(amount: Int) {
        guard amount < mana else {
            mana = 0
            return
        }
        
        guard amount > 0 else {
            print("Mana leak cant be negative")
            return
        }
        
        mana -= amount
    }
}

class AntiMage: GameCharacter {
    // MARK: - Public Properties
    var radianceOwner: Bool
    
    // MARK: - Private Properties
    private var agility: Int
    
    // MARK: - Initializers
    init(name: String, health: Int = 10, level: Int = 1, agility: Int = 10, radianceOwner: Bool = true) {
        self.agility = agility
        self.radianceOwner = radianceOwner
        
        super.init(name: name, health: health, level: level)
    }
    
    // MARK: - Overrides
    override func basicAttack(target: GameCharacter) {
        guard isAlive else {
            print("\(name) is dead, cant attack")
            return
        }

        target.takeDamage(amount: 1)
        radianceOwner ? print("\(name) attacked \(target) with radiance") : print("\(name) attacked \(target) without radiance")
    }
    
    // MARK: - Public Methods
    func castCounterspell(target: GameCharacter, with radius: Int, willTake manaAmount: Int) {
        guard isAlive else {
            print("\(name) is dead, cant attack")
            return
        }

        if let wizardTarget = target as? Wizard {
            wizardTarget.manaLeak(amount: manaAmount)
            print("\(name) attacked \(target) within \(radius) m and take \(manaAmount) mana from them")
        } else {
            target.takeDamage(amount: 0)
            print("There is no mana to take")
        }
    }
}

// Создайте 1 или 2 протокола способностей (на выбор, например, Flyable, Healable или свои):
// Протокол должен требовать:
//  1 свойство (например, flightSpeed),
//  1 метод (например, fly()).
//  Сделайте так, чтобы 1 или оба ваших подкласса персонажей соответствовали этим протоколам.

protocol Intelligent {
    var intelligence: Int { get set }
    func diplomaticConflictResolution(target: GameCharacter)
}

protocol NotSoIntelligent {
    var radianceOwner: Bool { get set }
    func buyRadiance()
}

extension Wizard: Intelligent {
    func diplomaticConflictResolution(target: GameCharacter) {
        guard isAlive else {
            print("\(name) is dead, cant attack")
            return
        }

        if !target.isAlive {
            target.heal(amount: 1)
        }
        
        print("Resolved the conflict with \(target) without a fight")
    }
}

extension AntiMage: NotSoIntelligent {
    func buyRadiance() {
        guard isAlive else {
            print("\(name) is dead, cant buy radiance")
            return
        }

        self.radianceOwner = true
        print("Oh, it's a good thing my team doesn't know...")
    }
}

//  Используйте расширения для класса GameCharacter:
//  Добавьте вычисляемое свойство isAlive (Bool, health > 0).
//  Добавьте метод printCharacterInfo() для вывода информации о персонаже в консоль.

extension GameCharacter {
    var isAlive: Bool {
        health > 0 ? true : false
    }
    
    func printCharacterInfo() {
        isAlive ? print("Alive character with name \(name), health \(health), level \(level)") : print("Dead character with name \(name), health \(health), level \(level)")
    }
}

//  Продемонстрируйте работу системы:
//  Создайте экземпляры персонажей разных типов.
//  Продемонстрируйте взаимодействие: атаки, лечение (если есть), повышение уровня.
//  Используйте printCharacterInfo() для вывода информации о персонажах.

let basicCharacter = GameCharacter(name: "TPaBoMaH", health: 1)
let frieren = Wizard(name: "Frieren", health: 1000000, level: Int.max - 1, mana: Int.max - 1, intelligence: Int.max - 1)
let seregaPirat = AntiMage(name: "Serega Pirat", health: 200, level: 2, agility: 11)

print("Leveling")
basicCharacter.levelUp()
frieren.levelUp()
seregaPirat.levelUp()

print("Fighting")
basicCharacter.basicAttack(target: seregaPirat)
seregaPirat.basicAttack(target: basicCharacter)
basicCharacter.printCharacterInfo()

seregaPirat.basicAttack(target: frieren)
seregaPirat.castCounterspell(target: frieren, with: 10, willTake: 10000)
seregaPirat.printCharacterInfo()

print("Resolving")
frieren.diplomaticConflictResolution(target: seregaPirat)
frieren.heal(amount: 250)
frieren.printCharacterInfo()
