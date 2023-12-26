//
//  CardPlacesModel.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 26/12/2023.
//

import Foundation

struct  CardPlacesModel: Codable, Identifiable {
    
    var id: UUID
    var imagName1: String
    var title: String
    var suptitle: String
    var place: String
    var imagName2: String
    var tapySport: String
    var tapyPlace: String
}

