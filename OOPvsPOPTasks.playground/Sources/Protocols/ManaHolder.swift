//
//  ManaHolder.swift
//  
//
//  Created by Сомов Кирилл on 13.03.2025.
//


public protocol ManaHolder {
    var mana: Int { get set }
    func manaLeak(amount: Int)
}
