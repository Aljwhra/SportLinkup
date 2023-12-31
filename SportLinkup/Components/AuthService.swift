//
//  AuthService.swift
//  Sport
//
//  Created by ٍٍRaneem A on 09/06/1445 AH.
//

import Foundation

final class AuthService: ObservableObject {
    
    static let shared = AuthService()
    
    @Published var user: User? = nil
    var token: String = ""
    
    @Published var loggedIn: Bool = false
    @Published var isDarkMode: Bool = false
}
