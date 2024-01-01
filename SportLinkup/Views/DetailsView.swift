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
    
   
    
    var sportTitle: String
    var sportId: UUID
    
    @Namespace private var basicNS
    @State private var move = false
    
    var body: some View {
        NavigationStack{
            
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
                                    showSignInAlert.toggle()
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
            
        }
        .alert("Sign In", isPresented: $showSignInAlert, actions: {
            Button("Sign In") {
                showSignInView.toggle()
            }
            Button("Cancel", role: .cancel, action: {})
        })
        .fullScreenCover(isPresented: $showSignInView, content: {
            SignIn()
        })
        .onAppear{
            vm.fetchData()
        }
        
        
        .navigationBarBackButtonHidden(true)
    }
    
}


#Preview {
    DetailsView(sportTitle: "", sportId: UUID())
}


