//
//  ActivitieDetails.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 28/12/2023.
//

import SwiftUI

struct ActivitieDetails: View {
    
    var act: Activities
    
    var body: some View {
        
        VStack(spacing: 20){
            
            
            
            AsyncImage(url: act.ImageName){ result in
                
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
                Text(act.activitieName)
                    .font(
                        Font.custom("Inter", size: 20)
                            .weight(.semibold)
                    )
                    .foregroundColor(.black)
                    .frame(width: 189, alignment: .leading)
                
                Text(act.supActivitieDes)
                    .multilineTextAlignment(.leading)
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.48, green: 0.46, blue: 0.46))
                    .frame(width: 229, alignment: .leading)
                
                HStack{
                    Text(act.place)
                        .font(
                            Font.custom("Inter", size: 20)
                                .weight(.medium)
                        )
                        .foregroundColor(Color(red: 0.04, green: 0.05, blue: 0.12))
                    Image("Image4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 30)
                }
                    .frame(width: 142, alignment: .leading)
                

                HStack{
                    Text("Time")
                        .font(
                            Font.custom("Inter", size: 20)
                                .weight(.semibold)
                        )
                        .foregroundColor(.black)
                    Image("Image2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 30)
                }
                    .frame(width: 189, alignment: .leading)
                
                Text(act.time ?? "")
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.48, green: 0.46, blue: 0.46))
                    .frame(width: 229, alignment: .leading)
            }.frame(width: 340 ,alignment: .leading)
            
            
        }
    }
}

#Preview {
    ActivitieDetails(act:Activities(ImageName: URL(string: "https://pbs.twimg.com/media/GBzUCwCWkAA_sWF?format=jpg&name=medium")!, activitieName: "Riyadh Marathon", activitieDes: "Third Edition The Saudi Sports ", supActivitieDes: "Third Edition The Saudi Sports for All Federation will hold the Riyadh Marathon ", place: "Riyadh", time: "on February 10, 2024", location: "a"))
}
