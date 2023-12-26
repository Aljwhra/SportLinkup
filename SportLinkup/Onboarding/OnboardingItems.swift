//
//  OnboardingItems.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 22/12/2023.
//

import SwiftUI

struct OnboardingItems: View , Identifiable{
    
    var id = UUID()
    var imageName: String
    var title: String
   // var subtitle: String
   
    
    var body: some View {
        
        VStack{
            Image(imageName)
                
            .resizable()
            .frame(width: 323,height: 331)
            .shadow(radius: 4 , y: 4 )
          
            
            Text(title)
                .font(.title)
              //  .font(Font.custom("Inter", size: 28))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)

            
       
         
            
            
        }
        .foregroundStyle(.white)
       
      
    }
}

#Preview {
    OnboardingItems(imageName: "Soccer", title: "You will find places\nSports easily")
}




  
