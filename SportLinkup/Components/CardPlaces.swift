//
//  CardPlaces.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 24/12/2023.
//

import SwiftUI

struct CardPlaces: View , Identifiable {
    
    var id = UUID()
    var imagName1: String
    var title: String
    var suptitle: String
    var place: String
    var imagName2: String
    
    var body: some View {
        
        HStack {
            Image(imagName1)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .cornerRadius(15)
            
            VStack{
                Text(title)
                    .fontWeight(.semibold)
                    .font(.title3)
                  
                
                Text(suptitle)
                    .foregroundStyle(Color("mygreyText"))
                  
                
                HStack{
                    Text(place)
                        .foregroundStyle(Color("mygreyText"))
                    
                    Image(imagName2)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 17, height: 21)
                }
            }
            .frame(width: 185, alignment: .leading)
        }
        .frame(width: 353, height: 156)
        .overlay(
          RoundedRectangle(cornerRadius: 15)
            .stroke(Color("mygreen"), lineWidth: 1.5)
        )
    }
}

#Preview {
    CardPlaces(imagName1: "IMG1", title: "Ad-Diriyah walking", suptitle: "A special path for walking and cycling", place: "Ad-Diriyah", imagName2: "3")
}
