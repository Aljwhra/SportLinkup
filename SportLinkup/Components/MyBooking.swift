////
////  My Booking.swift
////  SportLinkup
////
////  Created by Aljwhra Alnasser on 29/12/2023.
////
//
//import SwiftUI
//
//struct MyBooking: View , Identifiable{
//    var id = UUID()
//    var myBooking: BookingTicket
//    var cardPlaces: Sport
//    
//    var body: some View {
//        
//        VStack{
//            
//            HStack{
//                AsyncImage(url: cardPlaces.ImageName){ result in
//                    
//                    if let image = result.image{
//                        image
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 130, height: 130)
//                            .cornerRadius(15)
//                        
//                    }else{
//                        ProgressView()
//                            .frame(width: 130, height: 130)
//                    }
//                    
//                }
//                
//                
//                VStack(alignment: .leading){
//                    
//                    Text(cardPlaces.titile)
//                        .fontWeight(.semibold)
//                        .font(.title3)
//                    
//                    
//                    Text(cardPlaces.supTitle)
//                        .foregroundStyle(Color("mygreyText"))
//                        .multilineTextAlignment(.leading)
//                    
//                    HStack{
//                        Text(cardPlaces.place)
//                            .foregroundStyle(Color("mygreyText"))
//                        
//                     
//                    }
//                    
//                    
//                }
//                .frame(width: 185, alignment: .leading)
//            }
//            
//            VStack(alignment: .leading){
//                Text("Booking ID: \(myBooking.id)")
//                Text("Booking Date:\(myBooking.date)")
//                Text("Booking Time:\(myBooking.time)")
//                Text("Players:\(myBooking.numPlayers)")
//                Text("Total Price:\(myBooking.price)")
//               
//                
//            }.padding(.horizontal)
//            
//            
//        }
//        .frame(width: 345, height: 275)
//        .overlay(
//          RoundedRectangle(cornerRadius: 15)
//            .stroke(Color("mygreen"), lineWidth: 1.5)
//        )
//    }
//}
//
//#Preview {
//    MyBooking(myBooking: BookingTicket(idSport: UUID(), idUser: UUID(), numPlayers: 2, time: "r", date: Date(), price: 3), cardPlaces: Sport(typesport: "ci", gender: "wamane",ImageName: URL(string: "https://lh3.googleusercontent.com/p/AF1QipP1gKjsOYYw7lhKh8HmhRg2DVx96xTJ0D5OIyyD=s1360-w1360-h1020")! , titile: "Ad-Diriyah walking", supTitle: "A special path for walking and cycling", place: "Ad", typePlace: "puplic", time: "24hr", date: "02/2/2024", location: "hhh", dcsPlace: "hh"))
//}
