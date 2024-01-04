//
//  SportViewModel.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 27/12/2023.
//

import Foundation


class SportViewModel: ObservableObject {
    
    @Published var sports: [Sport] = []
  
    
    init(){
        
        fetchData()
    }
    
    
    func fetchData(){
        
        
        let url = URL(string: "https://rbwmtdrurgfwpunvvtmh.supabase.co/rest/v1/Sport?select=*")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Set your headers here
        request.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJid210ZHJ1cmdmd3B1bnZ2dG1oIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI5NzI3MDUsImV4cCI6MjAxODU0ODcwNX0.F28fGjHo4ctkF3ZXlljm4pemUT5ykECsXKvK9pW-DYU", forHTTPHeaderField: "apikey")
        request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJid210ZHJ1cmdmd3B1bnZ2dG1oIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI5NzI3MDUsImV4cCI6MjAxODU0ODcwNX0.F28fGjHo4ctkF3ZXlljm4pemUT5ykECsXKvK9pW-DYU", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error with fetching data: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data,
               let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
                
                
                let decoder = JSONDecoder()
                
                do {

                    self.sports = try decoder.decode([Sport].self,from: data)
                    
                    print(self.sports)
                    
                    }catch {
                    print(error as Any)
                }
            }
            
            
            
        }
        
        task.resume()
        
    }
    
}
