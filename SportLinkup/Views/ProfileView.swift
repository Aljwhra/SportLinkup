//
//  ProfileView.swift
//  Sport
//
//  Created by ٍٍRaneem A on 09/06/1445 AH.
//

import SwiftUI

struct ProfileView: View {
 
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var auth = AuthService.shared
    @State private var showSignInView: Bool = false
    @State var showSignoutConfirmationSheet: Bool = false
    
    var body: some View {
        VStack{
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
                    listRow(title: "Edit Profile", imageName: "Account") {
                        
                        EditProfileView()
                        
                    }
                    
                    listRow(title: "My Booking", imageName: "Improve") {
                        
                        MyBookingView()
                    }
                }
                
                listRow(title: "Privacy Policy", imageName: "Certificate") {
                   
                    TermsConditionsView()
                }
                
                HStack(spacing: 16) {
                    Image("FAQ")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                    Toggle("Dark Mode", isOn: $auth.isDarkMode)
                }
                
                
                Button {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    HStack(spacing: 0) {
                        Image("Change")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                        Text("Change Language")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .flipsForRightToLeftLayoutDirection(true)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
              
                
                if auth.user != nil {
                    Button {
                        signout()
                    } label: {
                        HStack(spacing: 16) {
                            Image("rectangle.portrait.and.arrow.left")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                            Text("Logout")
                                .foregroundStyle(.red)
                            Spacer()
                            Image("out")
                                .flipsForRightToLeftLayoutDirection(true)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    
                } else {
                    Button {
                        showSignInView.toggle()
                    } label: {
                        HStack(spacing: 16) {
                            Image("Log")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                            Text("Login")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .flipsForRightToLeftLayoutDirection(true)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                  
                }
                
                
                
            }
            .listStyle(.plain)
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            SignIn()
        })
        
    }
    
    func listRow(title: LocalizedStringKey, imageName: String, destination: () -> some View) -> some View {
        NavigationLink {
            destination()
        } label: {
            HStack(spacing: 0) {
                Image("\(imageName)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                Text(title)
             
                
            }
          
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

