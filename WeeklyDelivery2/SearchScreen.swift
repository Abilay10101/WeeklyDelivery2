//
//  SearchScreen.swift
//  WeeklyDelivery2
//
//  Created by Arip Khozhbanov on 18.05.2023.
//

import SwiftUI

struct Cat: Identifiable {
    let id = UUID()
    let name: String
    let emg: String
}

struct SearchScreen: View {
    
    @EnvironmentObject var db : ImmitationOfDB
    @EnvironmentObject var user : User
    @State var inCatViewIsOn: Bool = false
    @State var showRootView: Bool = false
    @State var catName: String = ""
    @State private var searchText = ""
        
    let products = [
        Cat(name: "Свежие овощи и фрукты", emg: "🍏"),
        Cat(name: "Напитки" , emg: "🥤"),
        Cat(name: "Молоко, сыр, масло, яйца", emg: "🥛"),
        Cat(name: "Рыба и морепродукты", emg: "🍤"),
        Cat(name: "Кулинария" , emg: "🥘"),
        Cat(name: "Фермерская лавка", emg: "🥔"),
        Cat(name: "Мясо, птица", emg: "🥩"),
        Cat(name: "Алкоголь" , emg: "🥃"),
        Cat(name: "Хлеб, выпечка", emg: "🍞"),
        Cat(name: "Замороженные продукты" , emg: "🍧"),
    ]
    
    var filteredProducts: [Cat] {
            if searchText.isEmpty {
                return products
            } else {
                return products.filter {
                    $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SearchBar(text: $searchText)
                    ForEach(filteredProducts) { product in
                        NavigationLink(isActive: $inCatViewIsOn) {
                            InCategoryScreen(catName: $catName)
                        } label: {
                            HStack {
                                Text(product.emg)
                                    .padding(.leading)
                                    .font(.system(size: 35))
                                    
                                Text(product.name)
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .padding()
                                    .foregroundColor(.black)
                            }.onTapGesture {
                                catName = product.name
                                inCatViewIsOn.toggle()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Искать на Арбузе", text: $text)
                .foregroundColor(.primary)
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}


struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
