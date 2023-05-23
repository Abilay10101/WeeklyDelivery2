//
//  Address.swift
//  WeeklyDelivery2
//
//  Created by Arip Khozhbanov on 20.05.2023.
//

import Foundation

enum Town : String , CaseIterable{
    case astana = "Астана"
    case almaty = "Алмата"
}

struct Address {
    var town: Town
    var street: String
    var kv: String
    var entrance: String
    var floor: String 
}
