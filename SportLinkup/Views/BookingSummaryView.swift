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
    
    let onDismiss: () -> ()
    
    @State var isNext = false
    
    var body: some View {
        
        
        VStack(spacing: 20){
            
            Text("Booking summary")
                .font(.title2)
                .fontWeight(.medium)
                .frame(width: 355, alignment: .leading)
                .padding(.top,30)
                .padding(.bottom,10)
            
            ScrollView(showsIndicators: false){
                
                VStack(alignment: .leading, spacing: 20){
                   
                    VStack(alignment: .leading,spacing: 5){
                      
                        HStack{
                            
                            Text("Date")
                                .font(Font.custom("Inter", size: 20)
                                    .weight(.medium))
                            Image("date")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 30)
                                
                        }
                        
                        Text("\(date)")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(.mygreyText))
                    }
                    
                    VStack(alignment: .leading,spacing: 5){
                        HStack{
                            Text("Players")
                                .font(Font.custom("Inter", size: 20)
                                    .weight(.medium))
                            
                            Image("Image1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 30)
                        }
                        
                        Text("\(digitData)")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(.mygreyText))
                    }
                    
                    VStack(alignment: .leading,spacing: 5){
                        HStack{
                            Text("Time")
                                .font(Font.custom("Inter", size: 20)
                                    .weight(.medium))
                            Image("Image2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 30)
                            
                        }
                        
                        Text("\(timePrice.time) hr")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(.mygreyText))
                    }

                   
              
                    Rectangle()
                        .fill(Color("mygreen"))
                        .frame(width: 345, height: 1)
                        .padding(.top)
                    
                    VStack(alignment: .leading,spacing: 5){
                       
                        HStack{
                            Text("Price")
                                .font(Font.custom("Inter", size: 20)
                                    .weight(.medium))
                            
                            Image("Image3")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 27)
                        }
                        
                        Text("Total Price: \(timePrice.price) SAR")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(.mygreyText))
                    }
                }
                
                
            }
            
            HStack(alignment: .center, spacing: 0) {
                NavigationLink {
                    AddCardTopayView(sportID: sportId, timePrice: timePrice, date: date, digitData: digitData, onDismiss: onDismiss)
                   
                } label: {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .background(Color.mygreen)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 45)
            .padding(15)
            
            .navigationBarBackButtonHidden()
            .navigationTitle("Booking")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor( Color.primary)
                            .flipsForRightToLeftLayoutDirection(true)
                    }
                }
            }
        }
        
    }
}



