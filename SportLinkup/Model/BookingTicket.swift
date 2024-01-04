//
//  BookingTicket.swift
//  SportLinkup
//
//  Created by Aljwhra & Raneem on 29/12/2023.


import Foundation

struct BookingTicket: Identifiable , Codable {
    
    var id = UUID()
    var idSport: UUID
    var idUser: Int
    var numPlayers: Int
    var time: String
    var date: Date
    var price: String
   
    init(id: UUID = UUID(), idSport: UUID, idUser: Int, numPlayers: Int, time: String, date: Date, price: String) {
        self.id = id
        self.idSport = idSport
        self.idUser = idUser
        self.numPlayers = numPlayers
        self.time = time
        self.date = date
        self.price = price
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.idSport = try container.decode(UUID.self, forKey: .idSport)
        self.idUser = try container.decode(Int.self, forKey: .idUser)
        self.numPlayers = try container.decode(Int.self, forKey: .numPlayers)
        self.time = try container.decode(String.self, forKey: .time)
        self.price = try container.decode(String.self, forKey: .price)
        let dateString = try container.decode(String.self, forKey: .date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = .init(identifier: "sa")
        self.date = dateFormatter.date(from: dateString)!
    }
    enum CodingKeys: CodingKey {
        case id
        case idSport
        case idUser
        case numPlayers
        case time
        case date
        case price
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.idSport, forKey: .idSport)
        try container.encode(self.idUser, forKey: .idUser)
        try container.encode(self.numPlayers, forKey: .numPlayers)
        try container.encode(self.time, forKey: .time)
        try container.encode(self.date.ISO8601Format(), forKey: .date)
        try container.encode(self.price, forKey: .price)
    }
}

