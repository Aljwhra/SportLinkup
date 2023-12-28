//
//  PadelDetailsView.swift
//  Sport
//
//  Created by ٍٍRaneem A on 12/06/1445 AH.
//

import SwiftUI

struct PadelDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var showLoginAlert: Bool = false
    let padel: Padel

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
           
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                        }
                    
                        
                        Spacer()
                        Text("Details")
                        Spacer()
                    }
                    
                    
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 277)
                        .padding(.top, 12)
                    
                    Text(padel.title)
                        .font(.headline)
                        .bold()
                        .padding(.top, 12)
                    
                    Text(padel.subTitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                
                HStack(alignment: .bottom) {
                    Text(padel.city)
                        .font(.headline)
                        .bold()
                        .padding(.top, 12)
                    
                    Image(padel.icon)
                }
                    
                    
                    Text(padel.city)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("Time")
                        .font(.headline)
                        .bold()
                        .padding(.top, 12)
                    
                    Text("4:00 pm - 2:00 am ")
                    .foregroundColor(.gray)
                 Text("all Days")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            showLoginAlert.toggle()
                        }
                        
                    }) {
                        Text("Book")
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .foregroundStyle(.black)
                            .background {
                                Color.mygreen
                            }
                            .cornerRadius(8)
                    }

                
                Button(action: {}) {
                    Text("See Location")
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .foregroundStyle(.black)
                        .background {
                            Color.mygreen
                        }
                        .cornerRadius(8)
                }
                    
                }
            .padding(24)
            
            if showLoginAlert {
                Color.black.opacity(0.20)
                    .ignoresSafeArea()
                VStack {
                    Text("To Book you need to sing in")
                    
                    Button(action: {
                        withAnimation {
                            showLoginAlert.toggle()
                        }
                    }) {
                        Text("Login")
                    }
                    
                    HStack {
                        Text("You don't have an account?")
                        Button("Sign Up", action: {})
                    }
                   
                }
                .padding(18)
                .background(Color.white)
                .cornerRadius(20)
            }
        }
            .navigationBarBackButtonHidden()
            
        }
    }


#Preview {
    PadelDetailsView(padel: .init(title: "Padel01", subTitle: "A padel clib you can book the please and play with your frindes", city: "Al Yasmin", image: "act1", icon: "b3"))
}
