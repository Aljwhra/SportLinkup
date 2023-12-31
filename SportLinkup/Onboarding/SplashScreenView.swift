////
////  SplashScreenView.swift
////  SportLinkup
////
////  Created by Aljwhra Alnasser on 22/12/2023.
////
//
//import SwiftUI
//
//struct SplashScreenView: View {
//    
//    @State private var isActive = false
//    @State private var size = 0.4
//    @State private var opacity = 0.5
//    
//    var body: some View {
//        ZStack{
//            
//            if isActive{
//                OnboardingView(didOnboard: .constant(false))
//            }else {
//                Color("mygreen")
//                    .ignoresSafeArea()
//          
//                VStack{
//                    VStack{
//                   
//                      
//                       Image("logo")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 393,height: 336)
//                       
//                    }
//                    .scaleEffect(size)
//                  //  .opacity(opacity)
//                    .onAppear{
//                        withAnimation(.easeIn(duration: 1.2)){
//                            self.size = 0.8
//                            self.opacity = 1.0
//                        }
//                    }
//                }
//                
//                .ignoresSafeArea()
//                .onAppear{
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
//                        
//                        withAnimation{
//                            self.isActive = true
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    SplashScreenView()
//}


//
//  SplashScreenView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 22/12/2023.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var didSplash: Bool
    //    @State private var isActive = false
    @State private var size = 0.4
    @State private var opacity = 0.5
    
    var body: some View {
        ZStack{
            
            
            Color("mygreen")
                .ignoresSafeArea()
            
            VStack{
                VStack{
                    
                    
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 393,height: 336)
                    
                }
                .scaleEffect(size)
                //  .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.8
                        self.opacity = 1.0
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                        withAnimation {
                            self.didSplash.toggle()
                        }
                    }
                }
            }
            
            .ignoresSafeArea()
            
            
        }
    }
}


#Preview {
    SplashScreenView(didSplash: .constant(false))
}
