//
//  BookingDetailsView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 29/12/2023.
//

import SwiftUI

struct BookingSummaryView: View {
    var date: Date
    var digitData: Int
    var sportId: UUID
    
    @State var isNext = false
    
    var body: some View {
        
        
        VStack(spacing: 20){
            
            Text("Booking summary")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width: 355, alignment: .leading)
                .padding(.top,30)
            
            ScrollView(showsIndicators: false){
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text("Date")
                        .font(.headline)
                    
                    Text("\(date)")
                        .font(Font.custom("Inter", size: 16))
                        .foregroundColor(Color(.mygreyText))
                    
                    Text("Players")
                        .font(.headline)
                    
                    Text("\(digitData)")
                    
                    Text("Time")
                        .font(.headline)
                    
                    // Text("\(sportId)")
                }
                
              
            }
            
            HStack(alignment: .center, spacing: 0) {
                Button(action: {
                    
                isNext = true
                    
                }, label: {
                    Text("Next")
                }).fullScreenCover(isPresented: $isNext) {
                    AddCardTopayView()
                }
            }
            .frame(maxWidth: .infinity)
            .padding(16)
            .background(Color.mygreen)
            .cornerRadius(10)
            .padding(.top, 45)
            .padding(11)
            
            .navigationTitle("Booking")
            }
            
        }
    }


#Preview {
    BookingSummaryView(date: Date(), digitData: 0, sportId: UUID())
}
