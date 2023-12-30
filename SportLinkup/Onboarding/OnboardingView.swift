//
//  OnboardingView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 22/12/2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.locale) var locale
    @Binding var didOnboard: Bool
    
    let onboardingItemsArry : [OnboardingItems] = [
        
        OnboardingItems(imageName: "Soccer",
                        title:"You will find places\nSports easily"),
        OnboardingItems(imageName: "Tennis",
                        title:"You can reserve the \nstadiums you want"),
        OnboardingItems(imageName: "Bike",
                        title: "You can discover sports\nvenues on the map" )
        ]
    
    
    @State var currentindex: Int = 0
    
    @State private var isSkip = false
    @State private var isStart = false
    
    var body: some View {
        VStack{
           
            VStack{
                TabView(selection: $currentindex){
                    ForEach(onboardingItemsArry.indices,id: \.self) { items in
                        onboardingItemsArry[items]
                    }
                    .padding(.top, 50)
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .overlay(
                        
                        HStack(spacing: 2){
                            ForEach(onboardingItemsArry.indices, id: \.self){ items in
                                let isCurrentPage: Bool = currentindex == items
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(isCurrentPage ? Color("mygreen") : Color("mygrey"))
                                    .frame(width: isCurrentPage ? 70 : 70 ,height: 5)
                                    .padding(.horizontal,10)
                                    .animation(.interactiveSpring(response: 0.5),value: isCurrentPage)
                                
                                
                            }
                        }
                           .offset(y:-300)
                        
                    )
                
                
                HStack{
                    
                    if currentindex != 2{
                        Button(action: {
                            isSkip = true
                        }, label: {
                            Text("Skip")
                                .font(.headline)
                                .frame(width: 130, height: 50)
                                .foregroundStyle(Color("mygreyText").opacity(0.7))
                            
                        })
                        .fullScreenCover(isPresented: $isSkip){
                            SignIn(didOnboard: $didOnboard)
                        }
                    
                        
                    } else {
                        
                        
                        Button(action: {
                            isStart = true
                        }, label: {
                            
                            HStack{
                                Text("Start")
                                    .bold()
                                   
                                
                                
                            }
                            .foregroundColor(.black)
                            .frame(width: 130, height: 50)
                            .background(Color("mygreen"))
                            .cornerRadius(55)
                            
                        })
                        .fullScreenCover(isPresented: $isStart){
                            SignIn(didOnboard: $didOnboard)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    OnboardingView(didOnboard:.constant(false) )
}
