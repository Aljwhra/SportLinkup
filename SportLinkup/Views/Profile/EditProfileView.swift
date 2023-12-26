//
//  EditProfileView.swift
//  Sport
//
//  Created by ٍٍRaneem A on 09/06/1445 AH.
//


import SwiftUI
import PhotosUI



struct EditProfileView: View {
    @StateObject private var vm = EditProfileViewViewModel()
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var auth = AuthService.shared
    
   
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Spacer()
                PhotosPicker(selection: $vm.imageItem, matching: .images) {
                    if let image = vm.image {
                       
                        image
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(.gray, lineWidth: 2)
                            }
                    } else {
                        Image(systemName:"person.fill")
                            
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 90)
                            .foregroundColor(.gray)
                            .clipShape(
                                Circle()
                            )
                            .overlay {
                                Circle()
                                    .stroke(.mygreen, lineWidth: 2)
                                    .frame(width: 100, height: 100)
                            }
                    }
                }
                .onChange(of: vm.imageItem) { oldValue, newValue in
                    Task {
                        if let data = try? await vm.imageItem?.loadTransferable(type: Data.self) {
                            if let uiImage = UIImage(data: data) {
                                vm.image = Image(uiImage: uiImage)
                                return
                            }
                        }
                    }
                }
                
                Spacer()
            }
            
            CustomTextField(title: "Name", text: $vm.name)
                .padding(.top, 18)
                .foregroundColor(.gray)
            CustomTextField(title: "Email Address", text: $vm.email)
                .padding(.top, 18)
                .foregroundColor(.gray)
            CustomTextField(title: "Mobile Number", text: $vm.mobile)
                .padding(.top, 18)
                .foregroundColor(.gray)
            CustomDatePicker(text: "Date of Birth", date: $vm.dob)
                .padding(.top, 18)
                .foregroundColor(.gray)
            Spacer()
            Button(action: { vm.update() }) {
                Text("Update")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(Color.mygreen)
                    .cornerRadius(12)
                    .foregroundColor(.black)
                
            }
            
            
        }
        .disabled(vm.networking)
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)

                        .flipsForRightToLeftLayoutDirection(true)
                }
            }
        }
        .padding()
        .onAppear {
            if let user = auth.user {
                vm.name = user.name
                vm.email = user.email
              
                vm.mobile = user.mobile
               
            }
        }
    }
    
   
    
    
}
#Preview {
    NavigationStack {
        EditProfileView()
    }
    
}
