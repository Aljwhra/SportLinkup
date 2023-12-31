//
//  ContentView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 25/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var auth = AuthService.shared
    
    @State var didSplash: Bool = false
    @State var didOnboard: Bool = false
    
    var body: some View {
        if didSplash {
            if didOnboard {
                CustomTabView()
            } else {
                OnboardingView(didOnboard: $didOnboard)
            }
        } else {
            SplashScreenView(didSplash: $didSplash)
        }
    }
}

#Preview {
    ContentView()
}

