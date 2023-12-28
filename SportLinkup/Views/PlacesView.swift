//
//  PlacesView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 24/12/2023.
//

import SwiftUI

struct PlacesView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var vm = SportViewModel()
    var sportTitle: String
    
    var body: some View {
        NavigationStack{
            HStack(spacing: 124){
                
                HStack{
                    Button{
                        
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                    }
                    
                }
                
                Text(sportTitle)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .frame(width: 350,alignment: .leading)
            .padding(.top)
            
            ScrollView{
                
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
                
                .navigationBarBackButtonHidden(true)
                
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

