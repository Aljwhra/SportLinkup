//
//  Activities.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 28/12/2023.
//

import Foundation


struct Activities: Identifiable , Codable{
    
    
    var id = UUID()
    var ImageName: URL
    var activitieName: String
    var activitieDes: String
    var supActivitieDes: String
    var place: String
    var time: String
    var location: String?
    
    
}

