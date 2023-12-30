////
////  PopupDetailsView.swift
////  SportLinkup
////
////  Created by Aljwhra Alnasser on 29/12/2023.
////
//
//import SwiftUI
//
//struct PopupDetailsView: View {
//    
//    @State var isSignIn = false
//    @StateObject var vm = SportViewModel()
//    var sportTitle: String
//    var sportId: UUID
//    
//    var body: some View {
//        ZStack{
//            
//            DetailsView(sportTitle: "", sportId: UUID())
//            
//            Color.black
//                .opacity(0.5)
//                .ignoresSafeArea()
//            Rectangle()
//                .frame(width: 350 ,height: 267)
//                .foregroundColor(.white)
//                .cornerRadius(30)
//            
//            VStack(spacing: 20){
//                Text("To Book you need\n to sing in")
//                    .font(Font.custom("Inter", size: 20))
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(.black)
//                
//                
//                Button {
//                    isSignIn = true
//                } label: {
//                    Text("Sign In")
//                     
//                    .padding(.horizontal, 0)
//                    .padding(.vertical, 15)
//                    .frame(width: 264, alignment: .center)
//                    .background(Color.mygreen)
//                    .cornerRadius(10)
//                }
//                .fullScreenCover(isPresented: $isSignIn ) {
//                    SignIn(didOnboard: .constant(false))
//                }
//                
//                
//
//                HStack {
//                    Text("You don't have an account?")
//                        .font(Font.custom("Inter", size: 15))
//                        .foregroundStyle(Color.gray)
//                    Button("Sign Up", action: {})
//                        .foregroundStyle(Color.mygreen)
//                }
//                .frame(maxWidth: .infinity)
//               
//
//                
//            }
//            
//        }
//    }
//}
//
//#Preview {
//    PopupDetailsView(sportTitle: "", sportId: UUID())
//}
