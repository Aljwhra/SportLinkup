//
//  PlacesView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 24/12/2023.
//

import SwiftUI

struct PlacesView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let  cardPlacesArry = [
        CardPlaces(imagName1: "IMG1", title: "Ad-Diriyah walking", suptitle: "A special path for walking and cycling", place: "Ad-Diriyah", imagName2: "3"),
        CardPlaces(imagName1: "IMG1", title: "Ad-Diriyah walking", suptitle: "A special path for walking and cycling", place: "Ad-Diriyah", imagName2: "3"),
        CardPlaces(imagName1: "IMG1", title: "Ad-Diriyah walking", suptitle: "A special path for walking and cycling", place: "Ad-Diriyah", imagName2: "3"),
        CardPlaces(imagName1: "IMG1", title: "Ad-Diriyah walking", suptitle: "A special path for walking and cycling", place: "Ad-Diriyah", imagName2: "3")
    ]
    
    var body: some View {
        NavigationStack{
            HStack(spacing: 123){
                
                HStack{
                    Button{
                        
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                    }
                    
                }
                
                Text("Cycling")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .frame(width: 350,alignment: .leading)
            .padding(.top)
            
            ScrollView{
                
                VStack{
                    
                    
                    VStack(spacing: 16){
                        ForEach(cardPlacesArry){ places in
                            
                            NavigationLink(
                                destination: DetailsView(),
                                label: {
                                    places
                                    
                                })
                        }
                    }
                    .padding(.top,3)
                }
                
                
                
                .navigationBarBackButtonHidden(true)
                
            }
        }
    }
}

#Preview {
    PlacesView()
}

