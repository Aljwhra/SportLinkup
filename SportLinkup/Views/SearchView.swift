
//  SearchView.swift
//  SportLinkup
//
//  Created by Raneem A on 25/12/2023.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    @State var searchText: String = ""
    
    @State private var sports: [Sport] = []
    @State private var filtered: [Sport] = []
    
    var body: some View {
        NavigationStack {
            VStack{
          
                
                List {
                    ForEach(filtered) { sport in
                        NavigationLink(
                            destination: DetailsView(sportTitle: sport.typesport, sportId:sport.id),
                            label: {
                                CardPlaces(cardPlaces: sport)
                                
                            })
                    }
                    
                }
                .listStyle(.plain)
                .searchable(text: $searchText)
                .onChange(of: searchText) { oldValue, newValue in
                    filtered = sports.filter {
                        $0.titile.contains(newValue)
                    }
                }
               
                
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Search")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 20))
                            .foregroundColor(Color.primary)
                    }
                }
            }
        }
        .onAppear {
            fetch()
        }
    }
    
    private func fetch() {
        Task {
            do {
                let result: [Sport] = try await SupabaseHelper.read(tableName: "Sport")
                sports = result
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    SearchView()
}

