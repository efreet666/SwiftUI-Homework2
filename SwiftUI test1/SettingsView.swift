//
//  SettingsView.swift
//  SwiftUI test1
//
//  Created by Влад Бокин on 10.05.2022.
//

import SwiftUI

struct SettingsView: View {
    @State var section = 0
    var sizes = ["42", "43", "44", "45", "46"]
    
    
    var body: some View {
        NavigationView{
            Form{
                Picker(selection: $section, label: Text("Размер")){
                    ForEach(0..<sizes.count) {
                       Text(self.sizes[$0])
                    }
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
