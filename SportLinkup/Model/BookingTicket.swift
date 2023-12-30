//
//  BookingTicket.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 29/12/2023.
//

import Foundation

struct BookingTicket: Identifiable , Codable {
    
    var id = UUID()
    var idSport: UUID
    var idUser: UUID
    var numPlayers: Int
    var time: String
    var date: Date
    var price: Int
   
    
}
