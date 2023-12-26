//
//  EditProfileViewViewModel.swift
//  Sport
//
//  Created by ٍٍRaneem A on 09/06/1445 AH.
//


import SwiftUI
import PhotosUI

class EditProfileViewViewModel: ObservableObject {
    @Published var imageItem: PhotosPickerItem?
    @Published var image: Image?
    
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var mobile: String = ""
    @Published var dob: Date = Date()
    
    @Published var gender: String = "Male"
    
    @Published var networking: Bool = false
    
    
    
    @MainActor
     func update() {
        Task {
            guard let user = AuthService.shared.user else { return }
            
            networking = true
            
            var updatedUser = User(name: name, uid: user.uid, dob: dob, email: email, mobile: mobile)
            updatedUser.id = user.id
            try await SupabaseHelper.update(object: updatedUser, tableName: "User", id: user.id)
            AuthService.shared.user = updatedUser
            
            networking = false
        }
    }
    
}
