//
//  InCategoryScreen.swift
//  WeeklyDelivery2
//
//  Created by Arip Khozhbanov on 19.05.2023.
//

import SwiftUI

struct InCategoryScreen: View {
    
    @Binding var catName : String
    
    @EnvironmentObject var db : ImmitationOfDB
    @EnvironmentObject var user : User
    

    
    var body: some View {
        VStack {

            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 40 )
                        .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                    HStack {
                        Image(systemName: "arrow.up.arrow.down")
                        Text("Без сортировки")
                    }
                }.padding(.leading)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 40 )
                        .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                    HStack {
                        Image(systemName: "slider.horizontal.3")
                        Text("Фильтры")
                    }
                }.padding(.trailing)
            }.frame(height: 50)
            
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(db.products, id: \.id) { item in
                        if item.category == catName && item.quantity > 0 {
                            CustomCell(image: item.imageURL, text: item.name, price: item.price,  action: {
                                if user.subsMade == false {
                                    if let index = user.basket.firstIndex(where: { $0.id == item.id }) {
                                        user.basket[index].quantity += 1
                                    } else {
                                        user.basket.append(Product(id: item.id, name: item.name, price: item.price, description: item.description, imageURL: item.imageURL, quantity: 1, category: item.category, weight: item.weight))
                                    }
                                }
                                
                                
                                
                            })
                                
                        }
                        
                    }
                }
                .padding()
            }
        }
    }
}

struct Item: Identifiable {
    let id = UUID()
    let image: String
    let text: String
}

//struct InCategoryScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        InCategoryScreen()
//    }
//}
