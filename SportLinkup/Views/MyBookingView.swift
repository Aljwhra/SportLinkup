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
            
            VStack{
              
                
                ForEach(tickets) { ticket in
                    VStack(spacing: 15){
                        HStack {
                            if let sport = sports.first(where: { $0.id == ticket.idSport }) {
                                AsyncImage(url: sport.ImageName){ result in
                                    
                                    if let image = result.image{
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 130, height: 130)
                                            .cornerRadius(15)
                                        
                                    }else{
                                        ProgressView()
                                            .frame(width: 130, height: 130)
                                    }
                                    
                                }
                                
                                VStack(alignment: .leading){
                                    Text(sport.titile)
                                    Text(sport.supTitle)
                                    Text(sport.place)
                                }.frame(width: 185, alignment: .leading)
                            }
                        }
                        
                        VStack(alignment: .leading){
                            Text("Booking ID: \(ticket.id)")
                            Text("Booking Date:\(ticket.date)")
                            Text("Booking Time:\(ticket.time)")
                            Text("Players:\(ticket.numPlayers)")
                            Text("Total Price:\(ticket.price)")
                        }.padding(.horizontal)
                    }
                    .frame(width: 345, height: 275)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("mygreen"), lineWidth: 1.5)
                    )
                    
                }
               
                
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


//#Preview {
//
//    MyBookingView(myBooking: BookingTicket(idSport: UUID(), idUser: UUID(), numPlayers: 2, time: "r", date: Date(), price: 3), cardPlaces: Sport(typesport: "ci", gender: "wamane",ImageName: URL(string: "https://lh3.googleusercontent.com/p/AF1QipP1gKjsOYYw7lhKh8HmhRg2DVx96xTJ0D5OIyyD=s1360-w1360-h1020")! , titile: "Ad-Diriyah walking", supTitle: "A special path for walking and cycling", place: "Ad", typePlace: "puplic", time: "24hr", date: "02/2/2024", location: "hhh", dcsPlace: "hh"))
//}
//

