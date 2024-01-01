//
//  CardExplore.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 23/12/2023.
//

import SwiftUI

struct CardExplore: View , Identifiable {
    
    var id = UUID()
    var imageName: String
    var title: String
    var typePlace: String
    
    var body: some View {
        VStack {
            
            Text(title)
                .foregroundStyle(.black)
               .font(.title2)
               .fontWeight(.semibold)
              .frame(width: 300,alignment: .topLeading)
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 221, height: 135)
        }
        .frame(width: 355, height: 210)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
    }
}

#Preview {
    CardExplore(imageName: "Run", title: "Cycling", typePlace: "")
}
