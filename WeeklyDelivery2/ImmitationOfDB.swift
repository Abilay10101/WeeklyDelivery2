//
//  ImmitationOfDB.swift
//  WeeklyDelivery2
//
//  Created by Arip Khozhbanov on 19.05.2023.
//

import Foundation

class ImmitationOfDB: ObservableObject {
    @Published var products = [
        Product(id: 0, name: "Apple", price: 120, description: "Apple", imageURL: "image1", quantity: 5, category: "Свежие овощи и фрукты", weight: 0.1),
        Product(id: 1, name: "Orange", price: 140, description: "Orange", imageURL: "image2", quantity: 0, category: "Свежие овощи и фрукты", weight: 0.1),
        
        Product(id: 2, name: "Cola", price: 420, description: "Cola", imageURL: "image3", quantity: 5, category: "Напитки", weight: 0.5),
        Product(id: 3, name: "Fanta", price: 420, description: "Fanta", imageURL: "image4", quantity: 5, category: "Напитки", weight: 0.5),
        
        Product(id: 4, name: "Сыр", price: 700, description: "Сыр", imageURL: "image5", quantity: 5, category: "Молоко, сыр, масло, яйца", weight: 0.2),
        Product(id: 5, name: "Молоко", price: 800, description: "Молоко", imageURL: "image6", quantity: 5, category: "Молоко, сыр, масло, яйца", weight: 0.5),
        
        Product(id: 6, name: "Рыба", price: 1500, description: "Рыба", imageURL: "image7", quantity: 5, category: "Рыба и морепродукты", weight: 1),
        Product(id: 7, name: "Раки", price: 4000, description: "Раки", imageURL: "image8", quantity: 5, category: "Рыба и морепродукты", weight: 1),
        
        Product(id: 8, name: "Тарелка", price: 2000, description: "Тарелка", imageURL: "image9", quantity: 5, category: "Кулинария", weight: 0.3),
        Product(id: 9, name: "Вилка", price: 800, description: "Вилка", imageURL: "image10", quantity: 5, category: "Кулинария", weight: 0.1),
        
    ]
}
