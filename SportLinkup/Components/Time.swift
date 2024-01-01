//
//  Time.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 25/12/2023.
//

import SwiftUI

struct Time: View {
    @Environment(\.colorScheme) var colorScheme
    let item: TimePrice
    @Binding var selected: Int
    
    var body: some View  {
        
        Button(action: {
            withAnimation {
                selected = item.id
            }
            
        }, label: {
            VStack {
                Text(item.time)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
              
                Text("Hours")
                    .font(.caption)
                
                  .foregroundColor(Color("mygreyText"))
                
                HStack(spacing: 1){
                    Text(item.price)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    Image("Cash")
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }
            }
            .frame(width: 74, height: 84)
            .background {
                if selected == item.id {
                    Color.mygreen
                        .cornerRadius(8)
                }
                
            }
            .overlay(
              RoundedRectangle(cornerRadius: 8)
                .stroke(Color("mygreen"), lineWidth: 1)
            )
           
        })
               
            
        
    }
}

#Preview {
    HStack {
        Time( item: .init(id: 0, time: "1-2", price: "200"), selected: .constant(0))
        Time( item: .init(id: 1, time: "1-3", price: "300"), selected: .constant(0))
        Time( item: .init(id: 2, time: "1-4", price: "400"), selected: .constant(0))
    }
}

