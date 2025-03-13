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

let basicCharacter = GameCharacter(name: "TPaBoMaH", health: 1)
let frieren = Wizard(name: "Frieren", health: 1000000, level: Int.max - 1, mana: Int.max - 1, intelligence: Int.max - 1)
let seregaPirat = AntiMage(name: "Serega Pirat", health: 200, level: 2, agility: 11)

print("1. Leveling testing")
basicCharacter.levelUp()
frieren.levelUp()
seregaPirat.levelUp()

print("\n2. Fighting and interaction testing")
basicCharacter.basicAttack(target: seregaPirat)
seregaPirat.basicAttack(target: basicCharacter)
basicCharacter.printCharacterInfo()

seregaPirat.basicAttack(target: frieren)
seregaPirat.castCounterspell(target: frieren, with: 10, willTake: 10000)
seregaPirat.printCharacterInfo()

print("\n3. Other stuff testing")
frieren.diplomaticConflictResolution(target: seregaPirat)
frieren.heal(amount: 250)
frieren.printCharacterInfo()

let punchBag = GameCharacter(name: "PunchBag", health: Int.max)
frieren.basicAttack(target: punchBag)


print("\n4. Inventory testing")
let greatCrosier = Crosier(weight: 1, durability: 100000, manaBonus: 10000)
greatCrosier.blessingFromTheHighMagician()
greatCrosier.shatter()
greatCrosier.fix()

let signature = Radiance(weight: 1000, durability: 20, skillBonus: 1)
let secondSignature = Radiance(weight: 100, durability: 20, skillBonus: 1)
signature.blessingFromSerega()

frieren.inventoryManager?.addItem(greatCrosier)
seregaPirat.inventoryManager?.addItem(signature)

seregaPirat.inventoryManager?.addItem(secondSignature)
seregaPirat.inventoryManager?.showInventory()
seregaPirat.inventoryManager?.removeItem(secondSignature)

frieren.inventoryManager?.showInventory()
seregaPirat.inventoryManager?.showInventory()
