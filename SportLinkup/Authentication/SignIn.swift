//
//  SignIn.swift
//  Sport
//
//  Created by ٍٍRaneem A on 09/06/1445 AH.
//
import SwiftUI

struct SignIn: View {
    
    //    @Binding var didOnboard: Bool
    
    @Environment(\.dismiss) var dismiss
    
    @State private var email = "Ra@email.com"
    @State private var password = "123456"
    
    @State var networking: Bool = false
    @State var isSignIn = false
    @State var isSignUp = false
    
    var body: some View {
        NavigationStack {
            VStack{
                
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Welcome Back")
                        .frame(maxWidth: .infinity)
                        .font(.title)
                        .padding(.top, 30)
                    Text("Email")
                        .font(.title3)
                        .foregroundStyle(.black)
                        .padding(.top, 92)
                    
                    TextField("Enter Your Email", text: $email)
                        .frame(maxWidth: .infinity)
                        .padding()
                    //.cornerRadius(10)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.mygreen, lineWidth: 1.5)
                        )
                        .padding(.top, 8)
                    
                    
                    Text("Password")
                        .font(.title3)
                        .foregroundStyle(.black)
                        .padding(.top, 15)
                    
                    SecureField("Enter Your Password ", text: $password)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.mygreen, lineWidth: 1.5)
                        )
                        .padding(.top, 8)
                    
                    Button(action:
                            {
                        login()
                    }, label: {
                        Text("Sign In")
                            .foregroundStyle(.black)
                        
                    })
                    
                    .frame(maxWidth: .infinity)
                    .padding(16)
                    .background(Color.mygreen)
                    .cornerRadius(10)
                    .padding(.top, 45)
                    
                    HStack {
                        Text("You don't have an account?")
                            .foregroundStyle(Color.gray)
                        NavigationLink("Sign Up") {
                            CreateAccount {
                                dismiss()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 45)
                    Spacer()
                }
                .padding(15)
                
                
                
                .edgesIgnoringSafeArea(.bottom)
                
                
                
            }
            .disabled(networking)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .font(.title)
                    }
                    
                }
            })
        }
        
    }
    
    @MainActor
    func login() {
        Task {
            do {
                networking = true
                let (uid, token) = try await SupabaseHelper.signIn(email: email, password: password)
                
                let result: [User] = try await SupabaseHelper.read(tableName: "User", column: "uid", value: uid)
                
                AuthService.shared.token = token
                AuthService.shared.user = result.first
                AuthService.shared.loggedIn = true
                networking = false
                dismiss()
            } catch {
                networking = false
                print(error)
            }
            
        }
    }
    
}

#Preview {
    SignIn()
}

