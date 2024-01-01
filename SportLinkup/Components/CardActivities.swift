//
//  CardActivities.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 28/12/2023.
//

import SwiftUI

struct CardActivities: View {
    
    var cardActivities : Activities
    
    var body: some View {
       
        HStack{
            
           
            
            AsyncImage(url: cardActivities.ImageName){ result in
                
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
                
                Text(cardActivities.activitieName)
                    .font(Font.custom("Inter", size: 19)
                    .weight(.semibold))
                
                Text(cardActivities.activitieDes)
                    .font(Font.custom("Inter", size: 16))
                    .foregroundStyle(Color("mygreyText"))
                    .multilineTextAlignment(.leading)
                
                HStack{
                    Text(cardActivities.place)
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
    CardActivities(cardActivities: Activities(ImageName:URL(string: "https://lh3.googleusercontent.com/p/AF1QipP1gKjsOYYw7lhKh8HmhRg2DVx96xTJ0D5OIyyD=s1360-w1360-h1020")!, activitieName: "Riyadh Marathon", activitieDes: "Third Edition The Saudi Sports ", supActivitieDes: "Third Edition The Saudi Sports for All Federation will hold the Riyadh Marathon ", place: "Riyadh", time: "on February 10, 2024", location: "a"))
}
