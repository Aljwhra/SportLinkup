//
//  CreateAccount.swift
//  Sport
//
//  Created by ٍٍRaneem A on 09/06/1445 AH.
//

import SwiftUI

struct CreateAccount: View {
    
//    @Binding var didOnboard: Bool
    @Environment(\.dismiss) var dismiss
    let dismissSignIn: () -> ()
    
    @State private var email = ""
    @State private var password = ""
    
    @State var networking: Bool = false
    
    var body: some View {
        
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
                    .foregroundStyle(.black)
                    .padding(.top, 54)
                
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
                    .padding(.top, 8)
                
                SecureField("Enter Your Password ", text: $password)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.mygreen, lineWidth: 1.5)
                    )
                
                
                Button(action: {
                    signUp()
//                    isSignUp = true
                    
                }, label: {
                    Text("Sign Up")
                        .font(.title3).bold()
                        .foregroundStyle(.black)
                        .padding(.horizontal ,100)
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
            .padding(11)
        
            .edgesIgnoringSafeArea(.bottom)
            .padding(.top,50)
            
            
        }
        .navigationBarBackButtonHidden()
        .disabled(networking)
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

//    func guest() {
//        didOnboard = true
//        AuthService.shared.loggedIn = true
//    }
    
    
}

#Preview {
    CreateAccount( dismissSignIn: {})
}

