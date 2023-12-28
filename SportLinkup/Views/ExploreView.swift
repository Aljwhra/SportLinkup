//
//  ExploreView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 22/12/2023.
//

import SwiftUI

struct ExploreView: View {
    
    
    
    
    let cardExploreArry = [
        CardExplore(imageName: "Bike2", title: "Cycling"),
        CardExplore(imageName: "Tennis2", title: "Padel courts"),
        CardExplore(imageName: "Soccer2", title: "soccer fields"),
        CardExplore(imageName: "Run", title: "Run")
    ]
    
    var body: some View {
        NavigationStack{
            
            VStack{
                
                HaderExplore()
                
                ButtonExplore()
                
                ScrollView{
                    VStack(spacing:19){
                        ForEach(cardExploreArry) { explore in
                            NavigationLink(
                                destination: PlacesView(sportTitle: explore.title ),
                                label: {
                                    explore
                                        
                                })
                            
                        }
                    }
                }
                .padding(.top)
                
                
            }
            
            
            
            
        }
    }
}

#Preview {
    ExploreView()
}
