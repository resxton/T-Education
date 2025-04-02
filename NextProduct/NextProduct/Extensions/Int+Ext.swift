//
//  Int+Ext.swift
//  NextProduct
//
//  Created by Сомов Кирилл on 02.04.2025.
//

import Foundation

extension Int {
    func formattedWithSpace() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "₽"
        formatter.currencyGroupingSeparator = " "
        formatter.maximumFractionDigits = 0
        formatter.usesGroupingSeparator = true
        return formatter.string(from: NSNumber(value: self)) ?? String(self)
    }
}
