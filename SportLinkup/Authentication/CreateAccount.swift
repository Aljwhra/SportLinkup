//
//  CreateAccount.swift
//  Sport
//
//  Created by ٍٍRaneem A on 09/06/1445 AH.
//

import SwiftUI

struct CreateAccount: View {
    
 
    @Environment(\.dismiss) var dismiss
    let dismissSignIn: () -> ()
    
    @State private var email = ""
    @State private var password = ""
    
    @State var networking: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Welcome to\n SportLinkup")
                        .multilineTextAlignment(.leading)
                    
                    
                        .font(.title)
                    
                    
                    Text("Create an account to save your time \n and effort in searching for sport\n places easily")
                    
                    
                    
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.gray)
                    
                        .padding(.top, 24)
                    
                    Text("Email")
                        .font(.title3)
                        .foregroundColor(Color.primary)
                        .padding(.top, 54)
                    
                    TextField("Enter Your Email", text: $email)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.mygreen, lineWidth: 1.5)
                        )
                        .padding(.top, 8)
                    
                    
                    Text("Password")
                        .font(.title3)
                        .foregroundColor(Color.primary)
                        .padding(.top, 8)
                    
                    SecureField("Enter Your Password ", text: $password)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.mygreen, lineWidth: 1.5)
                        )
                    
                    
                    Button(action: {
                        signUp()
                    }, label: {
                        Text("Sign Up")
                            .foregroundStyle(.black)
                    })
                    
                    .frame(maxWidth: .infinity)
                    .padding(16)
                    .background(Color.mygreen)
                    .cornerRadius(10)
                    .padding(.top, 44)
                    
                    HStack {
                        Text("Do you have an account? ")
                            .foregroundStyle(Color.gray)
                        Button("Sign In", action: {
                            dismiss()
                        })
                        .foregroundStyle(Color.mygreen)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 44)
                    Spacer()
                }
                .padding(15)
                
                .edgesIgnoringSafeArea(.bottom)
                .padding(.top,30)
                
                
            }
            .navigationBarBackButtonHidden()
            .disabled(networking)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color("mygreen"))
                            .font(.title3)
                    }
                    
                }
            })
        }
    }
    
    @MainActor
    func signUp() {
        Task {
            do {
                networking = true
                let (uid, token) = try await SupabaseHelper.signUp(email: email, password: password)
                
                // create User file in Supabase
                let user = User(name: "", uid: uid, dob: Date(), email: email, mobile: "")
                
                try await SupabaseHelper.create(object: user, tableName: "User")
                let result: [User] = try await SupabaseHelper.read(tableName: "User", column: "uid", value: uid)
                
                //                didOnboard = true
                AuthService.shared.token = token
                AuthService.shared.user = result.first
                AuthService.shared.loggedIn = true
                networking = false
                dismissSignIn()
            } catch {
                networking = false
                print(error)
            }
            
        }
    }
    
    
    
}

#Preview {
    CreateAccount( dismissSignIn: {})
}

