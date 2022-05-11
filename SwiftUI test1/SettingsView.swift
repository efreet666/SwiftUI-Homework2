//
//  SettingsView.swift
//  SwiftUI test1
//
//  Created by Влад Бокин on 10.05.2022.
//

import SwiftUI

struct SettingsView: View {
    @State var section = 0
    @State var section2 = 0
    @State var firstName = ""
    @State private var planeMode = false
    @State private var step = 20
    var sizes = ["42", "43", "44", "45", "46"]
    @State var error = false
    
    private func validationData(){
            error = !error
            return
    }
    
    var body: some View {
        NavigationView{
            VStack {
                Form{
                    Toggle(isOn: $planeMode, label: {
                        Text("Авиарежим")
                    })
                    Picker(selection: $section, label: Text("Размер")){
                        ForEach(0..<sizes.count) {
                           Text(self.sizes[$0])
                        }
                    }
                    Picker(selection: $section2, label: Text("Размер2")){
                        ForEach(0..<sizes.count) {
                           Text(self.sizes[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    TextField("Firstname", text: $firstName)
                    
                    Stepper(value: $step, in: 18...100, label: {
                        Text("Возраст: \(self.step)")
                    })
                        
                    if #available(iOS 15.0, *) {
                        Button(action: { error = !error
                        }, label: {Text("Проверить")}).alert(Text(firstName.isEmpty ? "Данные введены не корректно": "Введенное имя: \(firstName)"), isPresented: $error, actions: {})
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    
                }.navigationTitle(Text("Настройки"))
                Spacer()
                if #available(iOS 15.0, *) {
                    Button(action: { error = !error
                    }, label: {Text("Проверить")}).alert(Text(firstName.isEmpty ? "Данные введены не корректно": "Введенное имя: \(firstName), а возраст \(step)"), isPresented: $error, actions: {})
                        .padding()
                        .foregroundColor(.red)
                        
                } else {
                    // Fallback on earlier versions
                }
            }
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
