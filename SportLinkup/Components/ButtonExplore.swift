//
//  BoutenExplore.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 24/12/2023.
//

import SwiftUI

struct ButtonExplore: View {
    
  
    @State private var selected: Int = 0
    
    var body: some View {
       
        HStack{
       
                
                Button(action: {
                    withAnimation {
                        selected = 0
                    }
                }, label: {
                    Text("All")
                        .fontWeight(.semibold)
                      .foregroundColor(.black)
                      .padding(.horizontal,25)
                      .padding(.all,8)
                      .background(selected == 0 ? Color("mygreen") : .white)
                      .overlay(
                        RoundedRectangle(cornerRadius: 30)
                      .stroke(Color(red: 0.82, green: 0.91, blue: 0.91), lineWidth: 1.5)

                      )
                      .cornerRadius(30)
                })
                
               
            Button(action: {
                withAnimation {
                    selected = 1
                }
            }, label: {
                Text("Public")
                  .fontWeight(.semibold)
                  .foregroundColor(.black)
                  .padding(.horizontal,25)
                  .padding(.all,8)
                  .background(selected == 1 ? Color("mygreen") : .white)
                  .overlay(
                    RoundedRectangle(cornerRadius: 30)
                  .stroke(Color(red: 0.82, green: 0.91, blue: 0.91), lineWidth: 1.5)

                  )
                  .cornerRadius(30)
            })
            
            
            
            Button(action: {
                withAnimation {
                    selected = 2
                }
            }, label: {
                Text("Private")
                  .fontWeight(.semibold)
                  .foregroundColor(.black)
                  .padding(.horizontal,25)
                  .padding(.all,8)
                  .background(selected == 2 ? Color("mygreen") : .white)
                  .overlay(
                    RoundedRectangle(cornerRadius: 30)
                  .stroke(Color(red: 0.82, green: 0.91, blue: 0.91), lineWidth: 1.5)

                  )
                  .cornerRadius(30)
            })
         
            

        }
            
    }
}

#Preview {
    ButtonExplore()
}





