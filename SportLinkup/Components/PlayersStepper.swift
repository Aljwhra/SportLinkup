////
////  PlayersStepper.swift
////  SportLinkup
////
////  Created by Aljwhra Alnasser on 25/12/2023.
////
//
//import SwiftUI
//
//struct PlayersStepper: View {
//    
//    @State var digitData = 0
//    
//    
//    var body: some View {
//        
//        HStack{
//            Text("Players")
//                .font(.title2)
//                .fontWeight(.semibold)
//            
//            Spacer()
//            Button{
//                if digitData == 0 {}
//                else{
//                    digitData = digitData - 1
//                }
//            } label: {
//                Image (systemName: "minus")
//                    .frame(width: 35, height: 35, alignment: .center)
//                    .background(Color("mygrey"))
//                    .cornerRadius(10)
//                
//            }
//            
//            Text("\(digitData)")
//                .font(.title)
//            
//            Button{
//                if digitData == 4 {}
//                else{
//                    digitData = digitData + 1
//                }
//                
//            } label: {
//                Image (systemName: "plus")
//                    .frame(width: 35, height: 35, alignment: .center)
//                    .background(Color("mygreen"))
//                    .cornerRadius(10)
//                
//            }
//            
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    PlayersStepper()
//}
