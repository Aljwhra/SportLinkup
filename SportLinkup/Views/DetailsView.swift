//
//  DetailsView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 24/12/2023.
//



import SwiftUI


struct DetailsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @StateObject var vm = SportViewModel()
    @ObservedObject var auth = AuthService.shared
    @State private var showSignInAlert: Bool = false
    @State private var showSignInView: Bool = false
    @State var showAlert: Bool = false
    
    
    
    var sportTitle: String
    var sportId: UUID
    
    @Namespace private var basicNS
    @State private var move = false
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                ScrollView {
                    
                    ForEach(vm.sports){ detail in
                        if detail.id == sportId {
                            Details(details: detail)
                            //                            .matchedGeometryEffect(id: move ? "basic" : "", in: basicNS, isSource: false)
                            
                        }
                    }
                    
                    
                    
                    VStack(spacing:14){
                        
                        if sportTitle == "Padel courts" {
                            
                            HStack(alignment: .center, spacing: 0) {
                                
                                if auth.user != nil {
                                    
                                    NavigationLink {
                                        BookingView(sportId: sportId, sportTitle: sportTitle)
                                    } label: {
                                        Text("BooK")
                                            .frame(maxWidth: .infinity)
                                            .padding(16)
                                            .background(Color.mygreen)
                                            .cornerRadius(10)
                                    }
                                    
                                } else {
                                    
                                    Button(action: {
                                        showAlert = true
                                    }, label: {
                                        Text("BooK")
                                            .frame(maxWidth: .infinity)
                                            .padding(16)
                                            .background(Color.mygreen)
                                            .cornerRadius(10)
                                    })
                                    
                                }
                                
                                
                            }
                            .padding(.horizontal)
                        }
                        HStack(alignment: .center, spacing: 0) {
                            Button(action: {
                                
                                
                                if let specificActivity = vm.sports.first(where: { $0.id == sportId }),
                                   let urlString = specificActivity.location,
                                   let url = URL(string: urlString) {
                                    UIApplication.shared.open(url)
                                }
                                
                            }, label: {
                                Text("See Location")
                            })
                            .frame(maxWidth: .infinity)
                            .padding(16)
                            .background(Color.mygreen)
                            .cornerRadius(10)
                        }
                        .padding(.horizontal,15)
                    }.padding(.top,10)
                }
                
                if showAlert{
                    
                
                        Color.black.opacity(0.5)
                            .ignoresSafeArea()
                        
                    VStack(alignment: .center, spacing: 20){
                        
                        VStack{
                            Text("To Book you need\n to sing in")
                                .font(Font.custom("Inter", size: 20))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                        }
                        
                            Button(action: {
                                
                                showSignInView = true
                                
                            },label: {
                                Text("Sign In")
                                    .foregroundStyle(.black)
                                    .frame(width: 264, alignment: .center)
                                    .padding(.horizontal, 0)
                                    .padding(.vertical, 10)
                            })
                        
                            .background(Color("mygreen"))
                            .cornerRadius(10)
                        
                            .fullScreenCover(isPresented: $showSignInView, content: {
                                SignIn()
                            })
                        
                        HStack {
                            Text("You don't have an account?")
                                .foregroundStyle(Color.gray)
                            NavigationLink("Sign Up") {
                                CreateAccount {
                                    dismiss()
                                }
                            }
                        }
                           
                        }
                        .frame(maxWidth: 350, maxHeight: 267 )
                        .background(.white)
                        .cornerRadius(20)

                } 
                    
            }
            .padding(.top,10)
            .navigationTitle(sportTitle)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor( Color.primary)
                            .flipsForRightToLeftLayoutDirection(true)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            
       
            
        }
        .onAppear{
            vm.fetchData()
        }
    }
    
}


//        .alert("Sign In", isPresented: $showSignInAlert, actions: {
//            Button("Sign In") {
//                showSignInView.toggle()
//            }
//            Button("Cancel", role: .cancel, action: {})
//        })
//        .fullScreenCover(isPresented: $showSignInView, content: {
//            SignIn()
//        })


#Preview {
    DetailsView(sportTitle: "", sportId: UUID())
}


