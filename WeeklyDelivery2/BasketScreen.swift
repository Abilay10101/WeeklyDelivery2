//
//  BasketScreen.swift
//  WeeklyDelivery2
//
//  Created by Arip Khozhbanov on 18.05.2023.
//

import SwiftUI

struct BasketScreen: View {
    
    @EnvironmentObject var user : User
    @State var phoneN = false 
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        ForEach(user.basket) { item in
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16)
                                        .foregroundColor(Color.init(red: 0.91, green: 0.91, blue: 0.91))
                                        .frame(width: 100,height: 100)
                                        .padding(.leading)
                                    Image(item.imageURL)
                                        .resizable()
                                        .cornerRadius(14)
                                        .frame(width: 80, height: 80)
                                        .padding(.leading)
                                        
                                }
                                
                                VStack {
                                    
                                    Text(item.name)
                                        .font(.headline)
                                        .multilineTextAlignment(.leading)
                                    
                                    HStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 20)
                                                .frame(width: 120,height: 40)
                                                .foregroundColor(Color.init(red: 0.91, green: 0.91, blue: 0.91))
                                            HStack {
                                                
                                                if user.subsMade == false {
                                                    Button(action: {
                                                        if let index = user.basket.firstIndex(where: { $0.id == item.id }) {
                                                            user.basket[index].quantity -= 1
                                                            
                                                            if user.basket[index].quantity == 0 {
                                                                deleteItem(item)
                                                            }
                                                        }
                                                        
                                                        
                                                    }) {
                                                        
                                                        Image(systemName: "minus")
                                                            .foregroundColor(.black)
                                                        
                                                    }
                                                }
                                                
                                                
                                                Text("\(item.quantity)")
                                                    .padding(.horizontal, 10)
                                                
                                                if user.subsMade == false  {
                                                    Button(action: {
                                                        if let index = user.basket.firstIndex(where: { $0.id == item.id }) {
                                                            user.basket[index].quantity += 1
                                                        }
                                                    }) {
                                                        
                                                        Image(systemName: "plus")
                                                            .foregroundColor(.black)
                                                        
                                                    }

                                                }
                                                                                            }
                                        }
                                        Spacer()
                                        Text("\(item.quantity * item.price) Т")
                                    }
                                    
                                }
                                Spacer()
                                
                                VStack {
                                    if user.subsMade == false {
                                        Button(action: {
                                            deleteItem(item)
                                        }) {
                                            Image(systemName: "xmark")
                                                .foregroundColor(.gray)
                                        }
                                        .padding()
                                        Spacer()
                                    }
                                    
                                }
                                
                            }
                        }
                    }
                    
                }
                
                if !user.basket.isEmpty {
                    
                    if user.subsMade {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.yellow)
                                .frame( height: 58)
                            HStack {
                                Image(systemName: "lock")
                                    .foregroundColor(.black)
                                Text("Ваша корзина заморожена на время подписки")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 12))
                                    .bold()
                            }
                            
                        }.padding()
                    } else {
                        NavigationLink(isActive: $phoneN) {
                            PhoneNumberScreen(phoneN: $phoneN)
                                .environmentObject(user)
                        } label: {
                            MainButton(title: "Перейти к оплате") {
                                phoneN.toggle()
                            }
                        }
                    }
                    
                    
                    
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.init(red: 0.91, green: 0.91, blue: 0.91))
                            .frame( height: 58)
                        Text("Добавьте продукты в корзину")
                            .foregroundColor(Color.white)
                            .font(.system(size: 16))
                            .bold()
                    }.padding()
                }
                
            }.navigationTitle("Корзина")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                        
                        Button(action: {
                if user.subsMade == false {
                    deleteAllItems()
                }
                        }) {
                            if user.subsMade == false {
                                Image(systemName: "trash")
                            }
                            
                        }
                    )
        }
        
        
    }
    
    
    
    
    func deleteItem(_ item: Product) {
        if let index = user.basket.firstIndex(where: { $0.id == item.id }) {
            user.basket.remove(at: index)
        }
    }
    
    func deleteAllItems() {
        user.basket.removeAll()
    }
}


