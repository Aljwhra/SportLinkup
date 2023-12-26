//
//  CardView.swift
//  Sport
//
//  Created by ٍٍRaneem A on 11/06/1445 AH.
//


import SwiftUI

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                Image("bb")
                    .resizable()
                    .frame(width: 28, height: 22)
                    .background(Color.gray)
                    .cornerRadius(6)
                Spacer()
                Image("aa")
                    .resizable()
                    .frame(width: 18, height: 18)
            }
            Spacer()
            Text("1234 1234 1234 1234")
                .foregroundColor(.white)
                .fontDesign(.monospaced)
            Spacer()
            HStack {
                Spacer()
                Image("visa")
                    .resizable()
                    .frame(width: 44, height: 14)
            }
        }
        .padding(19)
        .frame(width: 250)
        .frame(height: 140)
        .background {
            Color.black
        }
        .cornerRadius(16)
        
    }
}
#Preview {
    CardView()
}
