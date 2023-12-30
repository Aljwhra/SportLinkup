//
//  PlacesView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 24/12/2023.
//

import SwiftUI

struct PlacesView: View {
    
  
    @StateObject var vm = SportViewModel()
 
    
    var sportTitle: String
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                VStack{
                    VStack(spacing: 16){
                        ForEach(vm.sports){ places in
                            if places.typesport == sportTitle {
                                NavigationLink(
                                    destination: DetailsView(sportTitle: sportTitle, sportId:places.id),
                                    label: {
                                        CardPlaces(cardPlaces: places)
                                        
                                    })
                            }
                        }
                    }
                    .padding(.top,3)
                }
                .navigationTitle(sportTitle)
                .navigationBarBackButtonHidden(false)
                .navigationBarTitleDisplayMode(.inline)
                
            }
            .onAppear{
                vm.fetchData()
            }
        }
    }
}

#Preview {
    PlacesView(sportTitle: "")
}

