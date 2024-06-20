//
//  Onboarding1View.swift
//  Apple Intelligence Recipe Generator
//
//  Created by Rod Datham on 20/6/2024.
//

import SwiftUI

struct Onboarding1View: View {
    var body: some View {
        VStack{
            Text("Tell us about you!").font(.title).foregroundColor(Color(red: 0.11372549019607843, green: 0.20392156862745098, blue: 0.12549019607843137)).bold().padding(/*@START_MENU_TOKEN@*/.all, 0.0/*@END_MENU_TOKEN@*/)
            Text("This will influence what recipes our AI shows").font(.body).foregroundColor(Color(red: 0.11372549019607843, green: 0.20392156862745098, blue: 0.12549019607843137))
        }
        
        
        
    }
}

#Preview {
    Onboarding1View()
}
