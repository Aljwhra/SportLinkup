//
//  SportLinkupApp.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 25/12/2023.
//

import SwiftUI

@main
struct SportLinkupApp: App {
    
    @ObservedObject var auth = AuthService.shared
    
    var body: some Scene {
        WindowGroup {
          SplashScreenView()
           // .preferredColorScheme(auth.isDarkMode ? .dark : .light)
        }
    }
}
