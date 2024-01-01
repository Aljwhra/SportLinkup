//
//  Details.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 27/12/2023.
//

import SwiftUI

struct Details: View {
    
    var details: Sport
    
    var body: some View {
        
        VStack(spacing: 20){
            
            
            
            AsyncImage(url: details.ImageName){ result in
                
                if let image = result.image{
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 300)
                        .cornerRadius(15)
                    
                }else{
                    ProgressView()
                        .frame(width: 130, height: 130)
                }
                
            }
            
         
               
            
            VStack(alignment: .leading, spacing: 15){
                Text(details.titile)
                    .font(Font.custom("Inter", size: 20)
                    .weight(.semibold))
                    .foregroundColor(Color("dark"))
                    .frame(width: 189, alignment: .leading)
                
                Text(details.supTitle)
                    .multilineTextAlignment(.leading)
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.48, green: 0.46, blue: 0.46))
                    .frame(width: 229, alignment: .leading)
               
                HStack{
                    Text(details.place)
                        .font(Font.custom("Inter", size: 20)
                            .weight(.medium))
                        .foregroundColor(Color("dark"))
                       
                    Image("Image4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 30)
                    
                }
                .frame(width: 142, alignment: .leading)
                
                Text(details.dcsPlace)
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.48, green: 0.46, blue: 0.46))
                    .frame(width: 229, alignment: .leading)
              
                HStack{
                    Text("Time")
                        .font(
                            Font.custom("Inter", size: 20)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color("dark"))
                    
                    Image("Image2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 30)
                    
                }
                .frame(width: 189, alignment: .leading)
                
                Text(details.time)
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.48, green: 0.46, blue: 0.46))
                    .frame(width: 229, alignment: .leading)
                
                HStack{
                    Text("For")
                        .font(
                            Font.custom("Inter", size: 20)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color("dark"))
                       
                    Image("Image5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 30)
                    
                }
                .frame(width: 189, alignment: .leading)
                
                Text(details.gender)
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.48, green: 0.46, blue: 0.46))
                    .frame(width: 229, alignment: .leading)
                
            }.frame(width: 340 ,alignment: .leading)
            
            
        }
    }
}

#Preview {
    Details(details:Sport(typesport: "ci", gender: "wamane",ImageName: URL(string: "https://lh3.googleusercontent.com/p/AF1QipP1gKjsOYYw7lhKh8HmhRg2DVx96xTJ0D5OIyyD=s1360-w1360-h1020")! , titile: "Ad-Diriyah walking", supTitle: "A special path for walking and cycling", place: "Ad", typePlace: "puplic", time: "24hr", date: "02/2/2024", location: "hhh", dcsPlace: "hh"))
}

