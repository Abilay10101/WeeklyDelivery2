//
//  SubscriptionScreen.swift
//  WeeklyDelivery2
//
//  Created by Arip Khozhbanov on 18.05.2023.
//

import SwiftUI

struct SubscriptionScreen: View {
    
    @EnvironmentObject var user : User
    @State var addressIsOn = false
    @State private var showAlert = false
    @State private var showAlert2 = false
    @Binding var phoneN : Bool
    
    
    var dayOfWArr = ["Понедельник","Вторник","Среда","Четверг","Пятница","Суббота","Воскресенье"]
    var timeArr = ["7:00-9:00","9:00-11:00","11:00-13:00","13:00-15:00","15:00-17:00","15:00-17:00","17:00-19:00","19:00-21:00", "21:00-23:00"]
    var subsPeriods = ["3 недели" , "6 недель" , "9 недель"]
    
    @State var str4 = ""
    
    var body: some View {
        
        ScrollView {
            VStack {
                Group {
                    MainLabel(title: "Адрес Доставки")
                    
                    NavigationLink(destination: AddressAddScreen(addressIsOn: $addressIsOn).environmentObject(user), isActive: $addressIsOn) {
                        HStack {
                            Text("Выбрать адрес")
                                .padding()
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .padding()
                                .foregroundColor(.black)
                        }
                        .frame(height: 50)
                        .onTapGesture {
                            addressIsOn.toggle()
                        }
                    }
                    
                    
                    
                    MainLabel(title: "Дата доставки")
                    SelectCollection(items: dayOfWArr, selectedItem: $user.dayOfWeek)
                        .padding(.horizontal)
                    MainLabel(title: "Время доставки")
                    SelectCollection(items: timeArr, selectedItem: $user.time)
                        .padding(.horizontal)
                    MainLabel(title: "Срок подписки")
                    SelectCollection(items: subsPeriods, selectedItem: $user.subPeriod)
                        .padding(.horizontal)
                }
                
                Group {
                    MainLabel(title: "Контактная информация")
                    MainTextField(placeholderT: "Имя получателя", text1: $user.name)
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                    MainTextField(placeholderT: "Комментарий", text1: $user.comment)
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                        
                }
                
                Group {
                    MainLabel(title: "Оплата")
                    HStack {
                        Text("Онлайн банковской картой")
                            .padding()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding()
                    }.frame(height: 50)
                    MainTextField(placeholderT: "Промокод", text1: $str4)
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                    
                }
                
                Group {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.init(red: 0.96, green: 0.96, blue: 0.96))
                            .frame(height: 200)
                        
                        VStack {
                            HStack {
                                Text("Продукты")
                                    .font(.system(size: 14))
                                    .padding()
                                Spacer()
                                Text("\(user.basket.reduce(0) { $0 + ($1.price * $1.quantity) }) Т")
                                    .font(.system(size: 14))
                                    .padding()
                            }
                            HStack {
                                Text("Стоимость доставки")
                                    .font(.system(size: 14))
                                    .padding(.horizontal)
                                    .padding(.vertical, 5)
                                Spacer()
                                Text("\(user.basket.reduce(0) { $0 + ($1.weight * Double($1.quantity)) } > 3.0 ? "500 Т" : "Бесплатно")")
                                    .font(.system(size: 14))
                                    .padding(.horizontal)
                                    
                            }
                            
                            Rectangle()
                                .frame(width: 348,height: 1)
                                .foregroundColor(Color.init(red: 0.90, green: 0.90, blue: 0.90))
                            
                            HStack {
                                Text("Итого")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(.horizontal)
                                    .padding(.vertical, 5)
                                Spacer()
                                Text(user.basket.reduce(0) { $0 + ($1.weight * Double($1.quantity)) } > 3.0 ? "\(user.basket.reduce(0) { $0 + ($1.price * $1.quantity) } + 500) Т" : "\(user.basket.reduce(0) { $0 + ($1.price * $1.quantity) }) Т")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(.horizontal)
                                
                            }
                            Spacer()
                            MainButton(title: "Подтвердите заказ") {
                                if user.name == "" || user.addresses.street == "" {
                                    showAlert = true
                                } else {
                                    phoneN = false
                                    user.subsMade = true
                                    
//                                    Thread.sleep(forTimeInterval: 2)
//
//                                    showAlert2 = true
                                }
                            }.padding(.vertical)
                                .alert(isPresented: $showAlert) {
                                    Alert(
                                        title: Text("Неверно введены поля"),
                                        message: Text("Введите пожалуйста имя и адрес проживания"),
                                        dismissButton: .default(Text("OK"))
                                    )
                                }
//                                .alert(isPresented: $showAlert2) {
//                                    Alert(
//                                        title: Text("Поздравляем!"),
//                                        message: Text("Подписка оформлена на \(user.subPeriod)!"),
//                                        primaryButton: .default(Text("Отменить подписку")) {
//                                            user.subsMade = false
//                                        },
//                                        secondaryButton: .default(Text("OK"))
//
//                                    )
//                                }
                        }
                    }
                    
                }.background(Color.init(red: 0.96, green: 0.96, blue: 0.96))
            }
        }
        
        
    }

}
