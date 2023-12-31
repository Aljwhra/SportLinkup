//
//  CustomTabView.swift
//  Sport
//
//  Created by ٍٍRaneem A on 09/06/1445 AH.
//


import SwiftUI

struct CustomTabView: View {
    
    enum Tab: String, CaseIterable {
        case Home
        case Map
        case Activities
        case Profile
        
        var icon: String {
            switch self {
            case .Home:
                return "home"
            case .Map:
                return "img2"
            case .Activities:
                return "barcode"
            case .Profile:
                return "Per"
            }
        }
    }
    
    @State var selectedTab: Tab = .Home
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                
                ZStack {
                    switch selectedTab {
                    case .Home:
                      ExploreView()
                    case .Map:
                       LocationMapView()
                    case .Activities:
                      ActivitiesView()
                    case .Profile:
                      ProfileView()
                    }
                }
          
                .frame(maxHeight: .infinity)
               
                
                HStack {
                    Spacer()
                    ForEach(Tab.allCases, id: \.self) { tab in
                        if selectedTab == tab {
                            Text(tab.rawValue)
                                .foregroundStyle(.black)
                        } else {
                            Button {
                                withAnimation {
                                    selectedTab = tab
                                }
                            } label: {
                                Image(tab.icon)
                                    .resizable()
                                    .frame(width: 16, height: 16 )
                                   
                                  
                            }
                        }
                            Spacer()
                        
                    }
                    
                }
                .padding(.vertical)
             
                .frame(maxWidth: .infinity)
                .background(Color.mygreen)
                .cornerRadius(10)
                .padding(.horizontal, 12)
            }
        }
        
    }
}

#Preview {
    CustomTabView()
}

