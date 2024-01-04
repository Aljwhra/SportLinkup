
//  PlacesView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 24/12/2023.
//

import SwiftUI

struct PlacesView: View {
   @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
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
                                        destination:
                                            DetailsView(sportTitle: sportTitle, sportId: places.id),
                                        label: {
                                            CardPlaces(cardPlaces: places)
                                        })
                                    
                                }
                            }
                        }
                        .padding(.top,3)
                        
                    }
                    
                    .navigationBarBackButtonHidden(true)
                    
                }
                .onAppear{
                    vm.fetchData()
                }
                .navigationTitle(sportTitle)
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: { dismiss() }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor( Color.primary)
                                .flipsForRightToLeftLayoutDirection(true)
                        }
                    }
                }
            }
            .onAppear {
                print("##", AuthService.shared.path)
            }
        }
    }
    

#Preview {
    PlacesView(sportTitle: "")
}
