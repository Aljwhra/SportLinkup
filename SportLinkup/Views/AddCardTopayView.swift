//
//  AddCardTopayView.swift
//  Sport
//
//  Created by ٍٍRaneem A on 12/06/1445 AH.
//


import SwiftUI

struct AddCardTopayView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
//    @StateObject var carVM = CardViewModel()
    @State var cardNumber: String = ""
    @State var cardHolder: String = ""
    @State var expairDate: Date = Date()
    @State var cvvNumber: String = ""
    @State var cardNumberError: String = ""
    @State var cardHolderError: String = ""
    @State var cvvNumberError: String = ""
    @State private var selectedCardType: Int = 0
    var dateFormater : DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
        
    }
    
    var body: some View {
        VStack(spacing: 20.0){
            
            HStack(alignment: .center, spacing: 14) {
                Button(action: {
                    withAnimation {
                        selectedCardType = 0
                    }
                }, label: {
                    Text("Visa Card")
                        .foregroundColor(selectedCardType == 0 ? .white : .gray)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 8)
                        .background(selectedCardType == 0 ? .black : .white)
                        .cornerRadius(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.mygreen, lineWidth: 0.5)
                        }
                })
                
                Button(action: {
                    withAnimation {
                        selectedCardType = 1
                    }
                }, label: {
                    Text("Master Card")
                        .foregroundColor(selectedCardType == 1 ? .white : .gray)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 8)
                        .background(selectedCardType == 1 ? .black : .white)
                        .cornerRadius(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.mygreen, lineWidth: 0.5)
                        }
                })
                
                Button(action: {
                    withAnimation {
                        selectedCardType = 2
                    }
                }, label: {
                    Text("Apple Pay")
                        .foregroundColor(selectedCardType == 2 ? .white : .gray)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 8)
                        .background(selectedCardType == 2 ? .black : .white)
                        .cornerRadius(8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.mygreen, lineWidth: 0.5)
                        }
                })
                Spacer()
            }
            
            ScrollView(.horizontal) {
                HStack {
                    CardView()
                    CardView()
                    CardView()
                }
            }
            
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.mygreen, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: 65)
                    .overlay{
                        VStack(alignment: .leading){
                            Text("Card Number")
                                .offset()
                                .foregroundColor(.black)
                            TextField("", text: $cardNumber)
                            
                            if (cardNumber.count != 16 ){
                               Text(cardNumberError)
                                    .font(.footnote)
                                    .foregroundColor(.red)
                            }
                        }.padding(.horizontal)
                    }.onChange(of: cardNumber) { newValue  , newValue2 in
                        if newValue.count != 16 {
                            cardNumberError = "Enter valid card number"
                        }
                    }
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.mygreen, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .padding(.top, 20)
                .frame(maxWidth: .infinity)
                .frame(height: 65)
                .overlay{
                    VStack(alignment: .leading){
                        Text("Full Name")
                            .offset()
                            .foregroundColor(.black)
                        TextField("", text: $cardHolder)
                        if (cardHolder.isEmpty ){
                           Text(cardHolderError)
                                .font(.footnote)
                                .foregroundColor(.red)
                        }
                        
                    }.padding(.horizontal)
                }.onChange(of: cardHolder) { newValue1 , newValue2 in
                    if newValue1.isEmpty {
                        cardHolderError = "Enter card holder name"
                    }
                }
            HStack(spacing: 20.0){
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.mygreen, lineWidth: 1.0)
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: 65)
                    .overlay{
                        VStack(alignment: .leading){
                            Text("CVV")
                                .offset()
                                .foregroundColor(.black)
                            
                            TextField("", text: $cvvNumber)
                            if cvvNumber.count != 3 {
                               Text(cardNumberError)
                                    .font(.footnote)
                                    .foregroundColor(.red)
                            }
                        }.padding(.horizontal)
                    }.onChange(of: cvvNumber) { newValue , newValue2 in
                        if newValue.count != 3 {
                            cardNumberError = "Enter valid CVV"
                        }
                    }
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.mygreen, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: 65)
                    .overlay{
//                        Text("Expiry Date")
                        VStack(alignment: .leading) {
                            Text("Expiry Date")
                                .offset()
                            .foregroundColor(.black)
                           
                              
                            DatePicker("", selection: $expairDate, displayedComponents: .date)
                                .labelsHidden()
                               
                         }.padding(.horizontal)
                           
                     }
                
                
            }
            
            Button {
                addCard()
            } label: {
                Text("Pay")
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color.mygreen)
                    .cornerRadius(12)
            }

            Button {
                

                  

                presentationMode.wrappedValue.dismiss()
            } label: {

            }

            
            
            
        }.padding(.horizontal)
        
            .navigationBarTitleDisplayMode(.inline)
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
    
    @MainActor
    func addCard() {
        Task {
            do {
                guard let user = AuthService.shared.user else  {
                    return
                }
                
                let card = Card(card_holder: cardHolder, card_number: cardNumber, cvv: cvvNumber, expiry_date: expairDate, uid: user.id)
                try await SupabaseHelper.create(object: card, tableName: "Card")
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    AddCardTopayView()
}
