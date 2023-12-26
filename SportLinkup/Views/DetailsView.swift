//
//  DetailsView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 24/12/2023.
//

import SwiftUI


struct DetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
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
                
                Text("Cycling")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .frame(width: 350,alignment: .leading)
            .padding(.top)
            
            ScrollView {
                VStack(spacing: 20){
                    Image("IMG1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 300)
                        .cornerRadius(15)
                    
                    VStack(alignment: .leading, spacing: 15){
                        Text("Ad-Diriyah walking")
                            .font(
                                Font.custom("Inter", size: 20)
                                    .weight(.semibold)
                            )
                            .foregroundColor(.black)
                            .frame(width: 189, alignment: .leading)
                        Text("A special path for cycling\nand walking")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.48, green: 0.46, blue: 0.46))
                            .frame(width: 229, alignment: .leading)
                        Text("Ad-Diriyah")
                            .font(
                                Font.custom("Inter", size: 20)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.04, green: 0.05, blue: 0.12))
                            .frame(width: 142, alignment: .leading)
                        Text("Al Faisaliyah, Diriyah \n13712")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.48, green: 0.46, blue: 0.46))
                            .frame(width: 229, alignment: .leading)
                        
                        Text("Time")
                            .font(
                                Font.custom("Inter", size: 20)
                                    .weight(.semibold)
                            )
                            .foregroundColor(.black)
                            .frame(width: 189, alignment: .leading)
                        
                        Text("Open For 24 hr")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(Color(red: 0.48, green: 0.46, blue: 0.46))
                            .frame(width: 229, alignment: .leading)
                    }.frame(width: 340 ,alignment: .leading)
                    
                    
                }
                
                
            }
            HStack(alignment: .center, spacing: 0) {
                Button(action: {
                    
                    
                    if let url = URL(string: "https://www.google.com/maps/place/ممشى+الدرعية%E2%80%AD/@24.7487507,46.5860901,17z/data=!4m14!1m7!3m6!1s0x3e2ee167de053f07:0xbb03b27f5bf3e11f!2z2YXZhdi02Ykg2KfZhNiv2LHYudmK2Kk!8m2!3d24.7487459!4d46.5835152!16s%2Fg%2F11gmzp0r9f!3m5!1s0x3e2ee167de053f07:0xbb03b27f5bf3e11f!8m2!3d24.7487459!4d46.5835152!16s%2Fg%2F11gmzp0r9f?entry=ttu") {
                        UIApplication.shared.open(url)
                    }
                    
                }, label: {
                    Text("See Location")
                })
            }
            .padding(.leading, 123)
            .padding(.trailing, 122)
            .padding(.vertical, 10)
            .frame(width: 370, alignment: .center)
            .background(Color(red: 0.82, green: 0.91, blue: 0.91))
            .cornerRadius(10)
            
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    DetailsView()
}


