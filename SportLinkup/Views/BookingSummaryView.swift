//
//  BookingDetailsView.swift
//  SportLinkup
//
//  Created by Aljwhra & Raneem on 29/12/2023.


import SwiftUI

struct BookingSummaryView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var date: Date
    var digitData: Int
    var timePrice: TimePrice
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
                    
                    
                    Text("\(timePrice.time) \(timePrice.price)")
                        .font(Font.custom("Inter", size: 16))
                        .foregroundColor(Color(.mygreyText))
                }
                
                
            }
            
            HStack(alignment: .center, spacing: 0) {
                NavigationLink {
                    AddCardTopayView(sportID: sportId, timePrice: timePrice, date: date, digitData: digitData)
                    
                } label: {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .background(Color.mygreen)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 45)
            .padding(11)
            .navigationBarBackButtonHidden()
            .navigationTitle("Booking")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor( Color.black)
                            .flipsForRightToLeftLayoutDirection(true)
                    }
                }
            }
        }
        
    }
}


#Preview {
    BookingSummaryView(date: Date(), digitData: 0, timePrice: .init(id: 0, time: "", price: ""), sportId: UUID())
}

