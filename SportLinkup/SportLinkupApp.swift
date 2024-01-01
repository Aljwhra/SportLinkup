//
//  SportLinkupApp.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 25/12/2023.
//gitHup

import SwiftUI

@main
struct SportLinkupApp: App {
    
    @ObservedObject var auth = AuthService.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
             .preferredColorScheme(auth.isDarkMode ? .dark : .light)
        }
    }
}

