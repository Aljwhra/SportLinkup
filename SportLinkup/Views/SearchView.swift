//
//  SearchView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 25/12/2023.
//

import SwiftUI

struct SearchView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack{
            HStack(spacing: 123){
                
                HStack{
                    Button{
                        
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                    }
                    
                }
                
                Text("Search")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .frame(width: 350,alignment: .leading)
            .padding(.top)
            
            ScrollView{
                HStack(alignment: .center, spacing: 0) {
                    Text("Search")
                      .font(Font.custom("Inter", size: 16))
                      .foregroundColor(.black)
                }
                .padding(.leading, 10)
                .padding(.trailing, 244)
                .padding(.top, 8)
                .padding(.bottom, 9)
                .frame(width: 307, alignment: .leading)
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                .cornerRadius(10)
            }
            
        }
    }
}

#Preview {
    SearchView()
}
