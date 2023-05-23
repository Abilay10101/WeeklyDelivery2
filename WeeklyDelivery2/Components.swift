//
//  Components.swift
//  WeeklyDelivery2
//
//  Created by Arip Khozhbanov on 18.05.2023.
//

import SwiftUI

struct Components: View {
    var body: some View {
        //MainTextF(str: $str)
        //CustomCell(image: "image1", text: "Яблоко")
        Text("fd")
    }
}

struct MainLabel: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 30, weight: .bold))
                .padding()
            Spacer()
        }
        
    }
}

struct MainTextField: View {
    let placeholderT: String
    @Binding var text1: String
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 60)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.init(red: 0.91, green: 0.91, blue: 0.91), lineWidth: 2)
                )
                
            TextField(placeholderT, text: $text1)
                .foregroundColor(Color.init(red: 0.7, green: 0.7, blue: 0.7))
                .multilineTextAlignment(.leading)
                .padding(.leading, 20)
                
        }
    }
    
    func getText() -> String {
        return text1
    }
}

struct SelectCollection: View {
    
    var items = [String]()
    
    @Binding var selectedItem: String
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem()]) {
                ForEach(items.indices, id: \.self) { index in
                    let item = items[index]
                    Text(item)
                        .padding(10)
                        .background(
                            item == selectedItem ?
                            Color(red: 0.95, green: 0.98, blue: 0.94) :
                            Color(red: 0.99, green: 0.99, blue: 0.99)
                        )
                        .foregroundColor(
                            item == selectedItem ?
                            Color(red: 0.49, green: 0.93, blue: 0.47) :
                            Color(red: 0.28, green: 0.28, blue: 0.28)
                        )
                        .cornerRadius(10)
                        .onTapGesture {
                            selectedItem = item
                        }
                }
            }
        }
    }
}


struct MainButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.init(red: 0.33, green: 0.79, blue: 0.35))
                    .frame( height: 58)
                Text(title)
                    .foregroundColor(Color.white)
                    .font(.system(size: 16))
                    .bold()
            }
        }.padding(.horizontal)
    }
    
}

struct CustomCell: View {
    var image: String
    var text: String
    var price: Int
    let action: () -> Void

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color.init(red: 0.91, green: 0.91, blue: 0.91))
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(.vertical, 35)
            }
            
            HStack {
                Text(text)
                    .font(.headline)
                Spacer()
            }
            
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 150,height: 40)
                        .foregroundColor(Color.init(red: 0.91, green: 0.91, blue: 0.91))
                    HStack {
                        
                        Text("\(price) Т")
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color.init(red: 0.91, green: 0.91, blue: 0.91))
                           
                        Button(action: {
                            action()
                        }) {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.green)
                                .padding(.leading)
                                
                                
                                
                        }
                    }
                    
                }
                
                Spacer()
            }
            
        }
    }
}



struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Components()
    }
}
