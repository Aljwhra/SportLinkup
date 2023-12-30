////
////  CalendarView.swift
////  SportLinkup
////
////  Created by Aljwhra Alnasser on 25/12/2023.
////
//
//import SwiftUI
//
//struct CalendarView: View {
//    
//    @State private var date = Date()
//    
//    var body: some View {
//        
//        VStack{
//            DatePicker("Birthday", selection: $date, displayedComponents: .date)
//                .accentColor(Color("mygreen"))
//            
//                .background(RoundedRectangle(cornerRadius: 20)
//                    .fill(Color.white)
//                    .stroke(Color("mygreen"), lineWidth: 1)
//                            
//                )
//            
//            
//                .datePickerStyle(.graphical)
//                .frame(width: 350)
//        }
//    }
//}
//
//#Preview {
//    CalendarView()
//}
