//
//  Product.swift
//  WeeklyDelivery2
//
//  Created by Arip Khozhbanov on 19.05.2023.
//

import Foundation

struct Product: Identifiable, Hashable {
    let id: Int
    let name: String
    let price: Int
    let description: String
    let imageURL: String
    var quantity: Int
    var category: String
    var weight: Double
}
