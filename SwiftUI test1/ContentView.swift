//
//  ContentView.swift
//  SwiftUI test1
//
//  Created by Влад Бокин on 07.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State var isError = false
    @State var isToggle = false
    
    var body: some View {
        
        
        
        
            VStack{
                
                Toggle(isOn: $isToggle, label: { Text("Боковое меню") })
                    .padding()
                    .frame(width: 250, height: 50)
                    
                    
                HStack{
                    ZStack{
                        HStack{
                            VStack {
                                Button(action: {}, label: {Text("Профиль")})
                                    
                                Button(action: {}, label: {Text("Настройки")})
                               
                            }
                            Spacer()
                        }
                        Spacer()
                    
                        RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.orange).frame( height: 650, alignment: .center).offset(x: isToggle ? 130: 0)
                        Text("Картинка").offset(x: isToggle ? 130: 0)
                        
                    }
                    
                }.animation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.6))
                
                
                
                
                Button(action: {isError = !isError}, label: {Text(" Скачать ")}).alert(isPresented: $isError, content: {
                    Alert(title: Text("Скачать?"),
                          message: Text("Точно нужно?"),
                          primaryButton: Alert.Button.destructive(Text("Можно ненада")),
                          secondaryButton: Alert.Button.default(Text("Да!")))
                })
            }
    
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 13 Pro")
        }
    }
}
