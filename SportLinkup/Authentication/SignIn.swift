//
//  SignIn.swift
//  Sport
//
//  Created by ٍٍRaneem A on 09/06/1445 AH.
//
import SwiftUI

struct SignIn: View {
    
    @Binding var didOnboard: Bool
    
    @State private var email = ""
    @State private var password = ""
    
    @State var networking: Bool = false
    
    var body: some View {
        
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
                
                Button(action: { signUp() }, label: {
                    Text("Sign Up")
                        .font(.title3).bold()
                        .foregroundStyle(.black)
                        .padding(.horizontal ,100)
                })
                .frame(maxWidth: .infinity)
                .padding(16)
                .background(Color.mygreen)
                .cornerRadius(10)
                .padding(.top, 45)
                HStack {
                    Text("You don't have an account?")
                        .foregroundStyle(Color.gray)
                    Button("Sign Up", action: {})
                        .foregroundStyle(Color.mygreen)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 45)
                Spacer()
            }
            .padding(11)
           

 
            .edgesIgnoringSafeArea(.bottom)
          
            
            
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

                didOnboard = true
                AuthService.shared.token = token
                AuthService.shared.user = result.first
                AuthService.shared.loggedIn = true
                networking = false
            } catch {
                networking = false
                print(error)
            }
      
        }
     }
    
}

#Preview {
    SignIn(didOnboard: .constant(false))
}
