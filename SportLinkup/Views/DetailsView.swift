//
//  DetailsView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 24/12/2023.
//

import SwiftUI


struct DetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var vm = SportViewModel()
    
    var sportTitle: String
    var sportId: UUID
    
    
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
                
                Text(sportTitle)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .frame(width: 350,alignment: .leading)
            .padding(.top)
            .padding(.bottom)
            
            ScrollView {
                
                ForEach(vm.sports){ detail in
                    if detail.id == sportId{
                        NavigationLink(
                            destination: BookingView(),
                            label: {
                                Details(details: detail)
                                
                            })
                        
                    }
                }
                
                VStack(spacing:14){
                    
                    if sportTitle == "Padel courts" {
                        HStack(alignment: .center, spacing: 0) {
                            Button(action: {
                                
                                
                            }, label: {
                                Text("BooK")
                            })
                            .frame(maxWidth: .infinity)
                            .padding(16)
                            .background(Color.mygreen)
                            .cornerRadius(10)
                            // .padding(.top, 45)
                        }
                        .padding(.horizontal)
                    }
                    HStack(alignment: .center, spacing: 0) {
                        Button(action: {
                            
                            
                            if let url = URL(string: "https://www.google.com/maps/place/ممشى+الدرعية%E2%80%AD/@24.7487507,46.5860901,17z/data=!4m14!1m7!3m6!1s0x3e2ee167de053f07:0xbb03b27f5bf3e11f!2z2YXZhdi02Ykg2KfZhNiv2LHYudmK2Kk!8m2!3d24.7487459!4d46.5835152!16s%2Fg%2F11gmzp0r9f!3m5!1s0x3e2ee167de053f07:0xbb03b27f5bf3e11f!8m2!3d24.7487459!4d46.5835152!16s%2Fg%2F11gmzp0r9f?entry=ttu") {
                                UIApplication.shared.open(url)
                            }
                            
                        }, label: {
                            Text("See Location")
                        })
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .background(Color.mygreen)
                        .cornerRadius(10)
                        // .padding(.top, 45)
                    }
                    .padding(.horizontal)
                }
                .padding(.top,10)
                
            }
            

            .onAppear{
                vm.fetchData()
            }
            
            
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    DetailsView(sportTitle: "", sportId: UUID())
}


