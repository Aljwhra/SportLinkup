//
//  CardPlacesModel.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 26/12/2023.
//

import Foundation

struct  Sport: Identifiable , Codable{
    
    
    var id = UUID()
    var typesport: String
    var gender: String
    var ImageName: URL
    var titile: String
    var supTitle: String
    var place: String
    var typePlace: String
    var time: String
    var date: String
    var location: String
    var dcsPlace: String
    
}

