//
//  MyBookingView.swift
//  SportLinkup
//
//  Created by Raneem A on 26/12/2023.
//

import SwiftUI

struct MyBookingView: View {
    
    
    @State private var sports: [Sport] = []
    @State private var tickets: [BookingTicket] = []
    var body: some View {
        
     
        ScrollView{
    
                ForEach(tickets) { ticket in
                    
                    VStack{
                        HStack{
                            if let sport = sports.first(where: { $0.id == ticket.idSport }) {
                                AsyncImage(url: sport.ImageName){ result in
                                    
                                    if let image = result.image{
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 110, height: 170)
                                            .clipped()
                                        
                                    }else{
                                        ProgressView()
                                            .frame(width: 130, height: 130)
                                    }
                                    
                                }
                                
                                VStack(alignment: .leading, spacing: 10){
                                    Text(sport.titile)
                                        .font(Font.custom("Inter", size: 16)
                                        .weight(.semibold))
                                    
                                    VStack(alignment: .leading, spacing: 5){
                                        
                                        Text("Booking ID: \(String(ticket.id.uuidString.suffix(8)))")
                                        Text("Date: \(ticket.date)")
                                        Text("Time: \(ticket.time)")
                                        Text("Players: \(ticket.numPlayers)")
                                        Text("Total Price: \(ticket.price)")
                                    }
                                    .font(Font.custom("Inter", size: 13)
                                    .weight(.medium))
                                }
                                .frame(width: 250,alignment: .leading )
                                .padding(.horizontal)
                            
                            }
                        }
                        .frame(width: 346, height: 170)
                        .background(Color(red: 0.83, green: 0.91, blue: 0.91).opacity(0.39))
                        .cornerRadius(15)
                     
                        
                   }
                    .padding(.top,10)
                }
                
           
            .navigationTitle("My Booking")
            .navigationBarBackButtonHidden(false)
        }
        .onAppear{
            fetchSports()
            fetchTickets()
        }
        
        
    }
    
    private func fetchSports() {
        Task {
            do {
                let result: [Sport] = try await SupabaseHelper.read(tableName: "Sport")
                sports = result
            } catch {
                print(error)
            }
        }
    }
    
    private func fetchTickets() {
        Task {
            do {
                if let user = AuthService.shared.user {
                    let result: [BookingTicket] = try await SupabaseHelper.read(tableName: "booking", column: "idUser", value: user.id)
                    tickets = result
                }
                
            } catch {
                print(error)
            }
        }
    }
}
