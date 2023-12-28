//
//  Time.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 25/12/2023.
//

import SwiftUI

struct Time: View, Identifiable {
    
    var id = UUID()
    var time : String
    var price: String
    
    var body: some View  {
        
      
                VStack {
                    Text(time)
                  
                    Text("Hours")
                        .font(.caption)
                    
                      .foregroundColor(Color("mygreyText"))
                    
                    HStack(spacing: 1){
                        Text(price)
                        Image("Cash")
                    }
                }
                .frame(width: 74, height: 84)
                .overlay(
                  RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("mygreen"), lineWidth: 1)
                )
            
        
    }
}

#Preview {
    Time(time: "1-2", price: "200")
}
