//
//  TermsConditionsView.swift
//  Sport
//
//  Created by ٍٍRaneem A on 11/06/1445 AH.
//


import SwiftUI

struct TermsConditionsView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Last update 31/12/2023")
                .foregroundColor(.gray)
            ScrollView{
                VStack(alignment: .leading, spacing: 12){
                    Text("Please read these terms of service, carefully before using our app operated by us.")
                    Text("Privacy Policy of SportLinkupApp")
                        .foregroundColor(.blue)
                    
                    Text(
                 """
                 The owner does not provide a list of Personal Data types collected.
                 Complete details on each type of Personal Data collected are provided in the dedicated sections of
                 this privacy policy or by specific explanation texts displayed prior to the Data collection.
                 Personal Data may be freely provided by the User, or, in case of Usage Data, collected automatically
                 when using this Application.
                 Unless specified otherwise, all Data requested by this Application is mandatory and failure to
                 provide this Data may make it impossible for this Application to provide its services.
                 In cases where this Application specifically states that some Data is not mandatory, Users are free
                 not to communicate this Data without consequences to the availability or the functioning of the Service.
                 Users who are uncertain about which Personal Data is mandatory are welcome to contact the Owner.
                 Any use of Cookies – or of other tracking tools — by this Application or by the owners of third-party
                 services used by this Application serves the purpose of providing the Service required by the User, in
                 addition to any other purposes described in the present document and in the Cookie Policy.
                 Users are responsible for any third-party Personal Data obtained, published or shared through this Application.
                """)
                    .multilineTextAlignment(.leading)
                    //  Spacer()
                }
            }
        }
        .navigationTitle("Privacy Policy")
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
    }
}

#Preview {
    NavigationStack {
        TermsConditionsView()
    }
}

