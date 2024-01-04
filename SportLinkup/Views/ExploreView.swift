//
//  ExploreView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 22/12/2023.
//

import SwiftUI

struct ExploreView: View {
    
    
    
    
    let cardExploreArry = [
        CardExplore(imageName: "Bike2", title: "Cycling", typePlace: "All"),
        CardExplore(imageName: "Tennis2", title: "Padel courts", typePlace: "Private"),
        CardExplore(imageName: "Soccer2", title: "Soccer Fields", typePlace: "Public"),
        CardExplore(imageName: "Run", title: "Walking", typePlace: "Public"),
        CardExplore(imageName: "Gym", title: "Fitness Equipment", typePlace: "Public")
        
    ]
    
    
    
    @State private var selectedFilter: FilterType = .All
    
    
    var filtered: [CardExplore] {
        switch selectedFilter {
        case .All:
            return cardExploreArry
        case .Public:
            return cardExploreArry.filter { $0.typePlace  == "Public" }
        case .Private:
            return cardExploreArry.filter { $0.typePlace  == "Private" }
        }
    }
    
    
    
    
    var body: some View {
        NavigationStack{
            
            VStack{
                
                HaderExplore()
                
                ButtonExplore(selectedFilter: $selectedFilter)
                
                ScrollView(showsIndicators: false){
                    
                    VStack(spacing:19){
                        ForEach(filtered) { explore in
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


enum FilterType{
    case All
    case Public
    case Private
}

#Preview {
    ExploreView()
}
