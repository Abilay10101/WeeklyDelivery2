//
//  PhoneNumberScreen.swift
//  WeeklyDelivery2
//
//  Created by Arip Khozhbanov on 20.05.2023.
//

import SwiftUI

struct PhoneNumberScreen: View {
    
    @EnvironmentObject var user : User
    @State var subsScr = false
    
    @Binding var phoneN : Bool
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            MainLabel(title: "Добавьте свой номер телефона")
            MainTextField(placeholderT: "+77051836304", text1: $user.phoneNumber)
                .padding(.horizontal)
            
            Spacer()
            
            if isPhoneNumberValid(user.phoneNumber) {
                
                NavigationLink(isActive: $subsScr) {
                    SubscriptionScreen(phoneN: $phoneN)
                        .environmentObject(user)
                } label: {
                    MainButton(title: "Продолжить регистрацию") {
                        subsScr.toggle()
                    }
                }
                
            } else {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.init(red: 0.91, green: 0.91, blue: 0.91))
                        .frame( height: 58)
                    Text("Введите номер телефона")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16))
                        .bold()
                }.padding()
                
            }
        }
        
        
    }
    
    func isPhoneNumberValid(_ text: String) -> Bool {
            let phoneRegex = #"\+7\d{10}"#
        
            let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phonePredicate.evaluate(with: text)
        }
    
}
