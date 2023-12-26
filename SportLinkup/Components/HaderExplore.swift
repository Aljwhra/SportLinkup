//
//  HaderExplore.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 24/12/2023.
//

import SwiftUI

struct HaderExplore: View {
    
    @State var isSearch = false
    
    var body: some View {
        HStack{
          
            Text("Explore")
                .fontWeight(.semibold)
                .font(.title)
              .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {
                isSearch = true
            }, label:{
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.black)
                    .background(
                        Circle()
                            .fill(Color("mygreen"))
                            .frame(width: 50, height: 50)
                    )
            })
            .padding()
            .fullScreenCover(isPresented: $isSearch){
                SearchView()
            }
            
        }.padding()
    }
}

#Preview {
    HaderExplore()
}
