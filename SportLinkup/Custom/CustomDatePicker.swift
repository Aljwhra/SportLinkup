//
//  CustomDatePicker.swift
//  Sport
//
//  Created by ٍٍRaneem A on 09/06/1445 AH.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @Environment(\.colorScheme) var colorScheme
    @FocusState var focus: Bool
    
    @State private var isFocused: Bool = false
    
    let text: String
    @Binding var date: Date
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Text(text.isEmpty ? text : "")
                .font(isFocused ? .caption : .headline)
                .offset(x: 0, y: isFocused ? -12 : 0)

            DatePicker("Date of brith", selection: $date, displayedComponents: .date)
                .font(.headline)
            
        }
        .frame(height: 50)
            .padding(.horizontal)
            .background(colorScheme == .dark ? Color.black : Color.white)
            .cornerRadius(8)
            .overlay(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isFocused ? Color.gray : Color.mygreen, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            }
            .onTapGesture {
                focus.toggle()
            }
    }
}

#Preview {
    VStack {
        CustomDatePicker(text: "Date of Birth", date: .constant(Date()))
    }
    .padding()
    
}

