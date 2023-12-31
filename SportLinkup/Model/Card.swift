//
//  Card.swift
//  Sport
//
//  Created by ٍٍRaneem A on 11/06/1445 AH.
//


import Foundation


struct Card: Codable, Identifiable {
    var id: Int
    let card_holder: String
    let card_number: String
    let cvv: String
    let expiry_date: Date
    let uid: Int
    
    init(card_holder: String, card_number: String, cvv: String, expiry_date: Date, uid: Int) {
        self.id = 0
        self.card_holder = card_holder
        self.card_number = card_number
        self.cvv = cvv
        self.expiry_date = expiry_date
        self.uid = uid
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.card_holder = try container.decode(String.self, forKey: .card_holder)
        self.card_number = try container.decode(String.self, forKey: .card_number)
        self.cvv = try container.decode(String.self, forKey: .cvv)
        self.uid = try container.decode(Int.self, forKey: .uid)
        let dateString = try container.decode(String.self, forKey: .expiry_date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = .init(identifier: "sa")
        self.expiry_date = dateFormatter.date(from: dateString)!
    }
    
    enum CodingKeys: CodingKey {
        case id
        case card_holder
        case card_number
        case cvv
        case expiry_date
        case uid
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        //try container.encode(self.id, forKey: .id)
        try container.encode(self.card_holder, forKey: .card_holder)
        try container.encode(self.card_number, forKey: .card_number)
        try container.encode(self.cvv, forKey: .cvv)
        try container.encode(self.expiry_date.ISO8601Format(), forKey: .expiry_date)
        try container.encode(self.uid, forKey: .uid)
    }
}

