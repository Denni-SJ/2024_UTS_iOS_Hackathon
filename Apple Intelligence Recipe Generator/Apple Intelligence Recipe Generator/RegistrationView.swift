//
//  RegistrationView.swift
//  Apple Intelligence Recipe Generator
//
//  Created by Rod Datham on 20/6/2024.
//

import SwiftUI

struct RegistrationView: View {
    var body: some View {
//        Color(UIColor(hex: "D7DDBC")).edgesIgnoringSafeArea(.all)
        VStack {
            Spacer()
            Image("cooking 1")
            VStack{
                Text("Welcome!").font(.title).foregroundColor(Color(red: 0.11372549019607843, green: 0.20392156862745098, blue: 0.12549019607843137)).bold().padding(/*@START_MENU_TOKEN@*/.all, 0.0/*@END_MENU_TOKEN@*/)
                
            }
            Spacer()
            
            ZStack {
                Image("Rectangle 1")
                Text("Let's get cooking!").font(.body).foregroundColor(Color(red: 0.8431372549019608, green: 0.8666666666666667, blue: 0.7372549019607844)).bold().padding(.vertical, 1.0)
                
            }
            
            
            
            
            
            
        }
       
        
    }
}

#Preview {
    RegistrationView()
}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0

        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0x00ff00) >> 8
        let b = rgbValue & 0x0000ff

        self.init(
            red: CGFloat(r) / 255.0,
            green: CGFloat(g) / 255.0,
            blue: CGFloat(b) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

