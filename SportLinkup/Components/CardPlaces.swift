//
//  CardPlaces.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 24/12/2023.
//

import SwiftUI

struct CardPlaces: View {

    @Environment(\.colorScheme) var colorScheme
    var cardPlaces: Sport
   
    var body: some View {
        
        HStack{
            
            AsyncImage(url: cardPlaces.ImageName){ result in
                
                if let image = result.image{
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 130, height: 130)
                        .cornerRadius(15)
                    
                }else{
                    ProgressView()
                        .frame(width: 130, height: 130)
                }
                
            }
         
            
            VStack(alignment: .leading,spacing: 10){
                
                Text(cardPlaces.titile)
                    .font(Font.custom("Inter", size: 19)
                    .weight(.semibold))
                    .foregroundStyle(colorScheme == .dark ? .white: .black)
                  
                
                Text(cardPlaces.supTitle)
                    .font(Font.custom("Inter", size: 16))
                    .foregroundStyle(Color("mygreyText"))
                    .multilineTextAlignment(.leading)
                
                HStack{
                    Text(cardPlaces.place)
                        .font(Font.custom("Inter", size: 16))
                        .foregroundStyle(Color("mygreyText"))
                    
                }
            }
            .frame(width: 185, alignment: .leading)
        }
        .frame(width: 353, height: 150)
        .overlay(
          RoundedRectangle(cornerRadius: 15)
            .stroke(Color("mygreen"), lineWidth: 1.5)
        )
    }
}

#Preview {
    CardPlaces(cardPlaces:Sport(typesport: "ci", gender: "wamane",ImageName: URL(string: "https://lh3.googleusercontent.com/p/AF1QipP1gKjsOYYw7lhKh8HmhRg2DVx96xTJ0D5OIyyD=s1360-w1360-h1020")! , titile: "Ad-Diriyah walking", supTitle: "A special path for walking and cycling", place: "Ad", typePlace: "puplic", time: "24hr", date: "02/2/2024", location: "hhh", dcsPlace: "hh"))
}


            

