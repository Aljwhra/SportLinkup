////
////  ActivitieDetailsView.swift
////  SportLinkup
////
////  Created by Aljwhra Alnasser on 28/12/2023.
////
//
//import SwiftUI
//
//struct ActivitieDetailsView: View {
//    
//
//    
//    @StateObject var vm = ActivitiesViewModel()
//    
//    var activitieID: UUID
//    
//    var body: some View {
//        
//        NavigationStack{
//            
//            ScrollView(showsIndicators: false){
//                
//                ForEach(vm.activitie){ act in
//                    if act.id == activitieID {
//                        ActivitieDetails(act: act )
//                        
//                    }
//                }
//            }
//            
//        }
//        
//        HStack(alignment: .center, spacing: 0) {
//            Button(action: {
//                
//                
//                if let specificActivity = vm.activitie.first(where: { $0.id == activitieID }),
//                   let urlString = specificActivity.location,
//                   let url = URL(string: urlString) {
//                    UIApplication.shared.open(url)
//                }
//                
//            }, label: {
//                Text("See Activity")
//            })
//            .frame(maxWidth: .infinity)
//            .padding(16)
//            .background(Color.mygreen)
//            .cornerRadius(10)
//        }
//        .padding(11)
//        .onAppear{
//            vm.fetchActivities()
//        }
//        
//        .navigationTitle("Activities")
//        .navigationBarBackButtonHidden(false)
//    }
//}
//
//
//#Preview {
//    ActivitieDetailsView(activitieID: UUID())
//}
//

//
//  ActivitieDetailsView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 28/12/2023.
//

import SwiftUI

struct ActivitieDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var vm = ActivitiesViewModel()
    
    var activitieID: UUID
    
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
                
                Text("Activities")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .frame(width: 350,alignment: .leading)
            .padding(.top)
            
            ScrollView {
                
                ForEach(vm.activitie){ act in
                    if act.id == activitieID {
                        ActivitieDetails(act: act )
                        
                    }
                }
                
                
                
                
                
                
            }
            
            HStack(alignment: .center, spacing: 0) {
                Button(action: {
                    
                    
                    if let specificActivity = vm.activitie.first(where: { $0.id == activitieID }),
                       let urlString = specificActivity.location,
                       let url = URL(string: urlString) {
                        UIApplication.shared.open(url)
                    }
                    
                }, label: {
                    Text("See Activity")
                })
                .frame(maxWidth: .infinity)
                .padding(15)
                .background(Color.mygreen)
                .cornerRadius(10)
            }.padding(.horizontal)
            
        }
        .onAppear{
            vm.fetchActivities()
        }
        
        
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    ActivitieDetailsView(activitieID: UUID())
}
