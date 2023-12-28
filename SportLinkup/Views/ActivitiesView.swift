//
//  ActivitiesView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 28/12/2023.
//

import SwiftUI

struct ActivitiesView: View {
    
    @StateObject var vm = ActivitiesViewModel()
    
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Activities")
                        .font(.title3)
                        .fontWeight(.semibold)
                }.padding()
                
                ScrollView{
                    VStack(spacing: 16){
                        ForEach(vm.activitie){ act in
                            NavigationLink(
                                destination: ActivitieDetailsView(activitieID: act.id), label: {
                                    CardActivities(cardActivities: act)
                                })
                            
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    ActivitiesView()
}


