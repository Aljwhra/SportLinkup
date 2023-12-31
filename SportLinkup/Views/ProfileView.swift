//
//  ProfileView.swift
//  Sport
//
//  Created by ٍٍRaneem A on 09/06/1445 AH.
//

import SwiftUI

struct ProfileView: View {
    //    @StateObject private var vm = ProfileViewViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var auth = AuthService.shared
    
    @State var showSignoutConfirmationSheet: Bool = false
    
    var body: some View {
        VStack {
            Text("Profile")
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                ZStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 45, height: 45)
                   
                }
                    .frame(width: 105, height: 105)
                    .foregroundColor(.black)
                    .background {
                        Circle()
                            .foregroundColor(.gray)
                    }
            })
            
            Text("Your Name")
                .padding(.top, 36)
            
            List {
                if auth.user != nil {
                    listRow(title: "Edit Profile", imageName: "edit1") {
                        
                        EditProfileView()
                        
                    }
                    
                    listRow(title: "My Booking", imageName: "Booking") {
                        
                        MyBookingView()
                    }
                }
                
                listRow(title: "Privacy Policy", imageName: "Terms") {
                    
                    TermsConditionsView()
                }
                
                HStack(spacing: 16) {
                    Image(colorScheme == .dark ? "theme_dark" : "theme_light")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)
                    Toggle("Dark Mode", isOn: $auth.isDarkMode)
                }
                .padding(.vertical, 12)
                
                Button {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    HStack(spacing: 16) {
                        Image(systemName: "globe")
                            .resizable()
                            .fontWeight(.thin)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 26, height: 26)
                        Text("Change Language")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .flipsForRightToLeftLayoutDirection(true)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 12)
                
                
                if auth.user != nil {
                    Button {
                        signout()
                    } label: {
                        HStack(spacing: 16) {
                            Image("rectangle.portrait.and.arrow.left")
                                .resizable()
                                .fontWeight(.thin)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 26, height: 26)
                            Text("Logout")
                                .foregroundStyle(.red)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .flipsForRightToLeftLayoutDirection(true)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 12)
                }
                
                
                
                
            }
            .listStyle(.plain)
        }
        
    }
    
    func listRow(title: LocalizedStringKey, imageName: String, destination: () -> some View) -> some View {
        NavigationLink {
            destination()
        } label: {
            HStack(spacing: 16) {
                //                Image(colorScheme == .dark ? "\(imageName)_dark" : "\(imageName)_light")
                Image("\(imageName)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26, height: 26)
                Text(title)
                Spacer()
                //Image(systemName: "chevron.right")
            }
            .padding(.vertical, 12)
        }
        
        
        
    }
    
    func signout() {
        auth.loggedIn = false
        auth.user = nil
        auth.token = ""
    }
}

    #Preview {
        NavigationStack {
            ProfileView()
        }
        
    }

