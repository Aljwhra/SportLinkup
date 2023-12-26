//
//  CustomTabView.swift
//  Sport
//
//  Created by ٍٍRaneem A on 09/06/1445 AH.
//


import SwiftUI

struct CustomTabView: View {
    
    enum Tab: String, CaseIterable {
        case home
        case map
        case scanner
        case profile
        
        var icon: String {
            switch self {
            case .home:
                return "home"
            case .map:
                return "img2"
            case .scanner:
                return "barcode"
            case .profile:
                return "Per"
            }
        }
    }
    
    @State var selectedTab: Tab = .home
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                
                ZStack {
                    switch selectedTab {
                    case .home:
                      ExploreView()
                    case .map:
                       LocationMapView()
                    case .scanner:
                        Text("notification")

                    case .profile:
                ProfileView()
                    }
                }
          
                .frame(maxHeight: .infinity)
               
                
                HStack {
                    Spacer()
                    ForEach(Tab.allCases, id: \.self) { tab in
                        if selectedTab == tab {
                            Text(tab.rawValue)
                                .foregroundStyle(.mygreen)
                        } else {
                            Button {
                                withAnimation {
                                    selectedTab = tab
                                }
                            } label: {
                                Image( tab.icon)
                                    .resizable()
                                    .frame(width: 16, height: 16 )
                                    .foregroundStyle(.white)
                                  
                            }
                        }
                            Spacer()
                        
                    }
                    
                }
                .padding(.vertical)
             
                .frame(maxWidth: .infinity)
                .background(Color.mygreen)
                .cornerRadius(12)
                .padding(.horizontal, 12)
            }
        }
        
    }
}

#Preview {
    CustomTabView()
}
