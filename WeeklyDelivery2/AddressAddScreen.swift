//
//  AddressAddScreen.swift
//  WeeklyDelivery2
//
//  Created by Arip Khozhbanov on 18.05.2023.
//

import SwiftUI

struct AddressAddScreen: View {
    
    @EnvironmentObject var user: User
    @Binding var addressIsOn: Bool
    
    var body: some View {
        
        VStack {
            
            
            Picker("Город", selection: $user.addresses.town) {
                ForEach(Town.allCases, id: \.self) { city in
                    Text(city.rawValue)
                }
            }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
            MainTextField(placeholderT: "Улица и номер дома", text1: $user.addresses.street)
                .padding(.horizontal)
            HStack {
                MainTextField(placeholderT: "Квартира", text1: $user.addresses.kv)
                    .padding(.leading)
                MainTextField(placeholderT: "Подъезд", text1: $user.addresses.entrance)
                MainTextField(placeholderT: "Этаж", text1: $user.addresses.floor)
                    .padding(.trailing)
            }
            
            Spacer()
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.init(red: 0.91, green: 0.91, blue: 0.91))
                    .frame( height: 58)
                Text("Заполните все поля")
                    .foregroundColor(Color.white)
                    .font(.system(size: 16))
                    .bold()
            }.padding()
            
        }
    }
}
