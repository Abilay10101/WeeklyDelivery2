//
//  User.swift
//  WeeklyDelivery2
//
//  Created by Arip Khozhbanov on 19.05.2023.
//

import Foundation

class User: ObservableObject {
    @Published var id = 1
    @Published var name = ""
    @Published var phoneNumber = ""
    @Published var addresses = Address( town: .almaty, street: "", kv: "", entrance: "", floor: "")
    @Published var dayOfWeek = "Понедельник"
    @Published var time = "7:00-9:00"
    @Published var comment = ""
    @Published var basket = [Product]()
    @Published var subPeriod = "3 недели"
    @Published var subsMade = false
}
