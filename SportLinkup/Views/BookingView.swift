//
//  BookingView.swift
//  SportLinkup
//
//  Created by Aljwhra & Raneem on 25/12/2023.
//

import SwiftUI

struct TimePrice: Identifiable {
    let id: Int
    let time: String
    let price: String
}

struct BookingView: View {
    var sportId: UUID
    @State var isNext = false
    
    var sportTitle: String
    @Environment(\.colorScheme) var colorScheme
    @State private var date = Date()
    @State var digitData = 0
    
    @Environment(\.dismiss) var dismiss
    
    let arryTime: [TimePrice] = [
        .init(id: 0, time: "1-2", price: "200"),
        .init(id: 1, time: "1-3", price: "300"),
        .init(id: 2, time: "1-4", price: "400"),
        .init(id: 3, time: "1-5", price: "500"),
        .init(id: 4, time: "1-6", price: "600"),
        .init(id: 5, time: "1-7", price: "700"),
        .init(id: 6, time: "1-8", price: "800"),
        .init(id: 7, time: "1-9", price: "900")
    ]
    @State var selectedTimePrice: Int = 0
    
    var body: some View {
        
        
        VStack{
            
            ScrollView(showsIndicators: false){
                
                VStack(alignment: .leading){
                    
                    Text("Select")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    
                }
                .frame(width: 350,alignment: .leading)
                .padding(.top)
                .padding(.bottom)
                
                VStack{
                    DatePicker("Birthday", selection: $date, displayedComponents: .date)
                        .accentColor(Color("mygreen"))
                    
                        .background(RoundedRectangle(cornerRadius: 20)
                            .fill(colorScheme == .dark ? Color.black.opacity(0.6) : Color.white)
                            .stroke(Color("mygreen"), lineWidth: 1)
                                    
                        )
                    
                    
                        .datePickerStyle(.graphical)
                        .frame(width: 350)
                }
                
                HStack{
                    Text("Players")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    Button{
                        if digitData == 0 {}
                        else{
                            digitData = digitData - 1
                        }
                    } label: {
                        Image (systemName: "minus")
                            .frame(width: 35, height: 35, alignment: .center)
                            .background(Color("mygrey"))
                            .cornerRadius(10)
                        
                    }
                    
                    Text("\(digitData)")
                        .font(.title)
                    
                    Button{
                        if digitData == 4 {}
                        else{
                            digitData = digitData + 1
                        }
                        
                    } label: {
                        Image (systemName: "plus")
                            .frame(width: 35, height: 35, alignment: .center)
                            .background(Color("mygreen"))
                            .cornerRadius(10)
                        
                    }
                    
                }
                .padding()
                
                Divider()
                    .background(Color("mygreen"))
                    .frame(width: 345)
                
                
                
                VStack(alignment: .leading){
                    Text("Time")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .frame(width: 350,alignment: .leading)
                
                ScrollView(.horizontal){
                    HStack{
                        ForEach(arryTime) { item in
                            Time(item: item, selected: $selectedTimePrice)
                        }
                    }.padding()
                }
                
                HStack(alignment: .center, spacing: 0) {
                    NavigationLink {
                        BookingSummaryView(date:date, digitData: digitData, timePrice: arryTime[selectedTimePrice], sportId: sportId )
                    } label: {
                        Text("Next")
                            .frame(maxWidth: .infinity)
                            .padding(16)
                            .background(Color.mygreen)
                            .cornerRadius(10)
                    }
                }
                .padding(.top, 45)
            }
            .padding(11)
            .padding(.top)
            .navigationTitle(sportTitle)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor( Color.black)
                            .flipsForRightToLeftLayoutDirection(true)
                    }
                }
            }
        }
    }
}

#Preview {
    BookingView(sportId: UUID(), sportTitle: "")
}

