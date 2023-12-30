//
//  BookingView.swift
//  SportLinkup
//
//  Created by Aljwhra Alnasser on 29/12/2023.
//

import Foundation

class BookingViewModel: ObservableObject {
    
    @Published var booking: [BookingTicket] = []
    
    init(){
        
        fetchBooking()
    }
    
    func fetchBooking(){
        
        let url = URL(string: "https://rbwmtdrurgfwpunvvtmh.supabase.co/rest/v1/booking?select=*")!
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

                    self.booking = try decoder.decode([BookingTicket].self,from: data)
                    
                    print(self.booking)
                    
                    }catch {
                    print(error as Any)
                }
            }
            
            
            
        }
        
        task.resume()
    }
    
    func addTicket(idSport: UUID,idUser: UUID, numPlayers: Int,time: String, date: Date,price: Int){
             let url = URL(string: "https://rbwmtdrurgfwpunvvtmh.supabase.co/rest/v1/booking")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"

            // Set your headers here
            request.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJid210ZHJ1cmdmd3B1bnZ2dG1oIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI5NzI3MDUsImV4cCI6MjAxODU0ODcwNX0.F28fGjHo4ctkF3ZXlljm4pemUT5ykECsXKvK9pW-DYU", forHTTPHeaderField: "apikey")
            request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJid210ZHJ1cmdmd3B1bnZ2dG1oIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI5NzI3MDUsImV4cCI6MjAxODU0ODcwNX0.F28fGjHo4ctkF3ZXlljm4pemUT5ykECsXKvK9pW-DYU", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("return=minimal", forHTTPHeaderField: "Prefer")

            // Start of JSON data definition
            let jsonString = """
            {
                "idSport": "\(idSport)",
                "idUser": "\(idUser)",
                "numPlayers": "\(numPlayers)",
                "time": "\(time)",
                "date": "\(date)",
                "price": "\(price)"
            
            }
            """

            // Converting JSON String to Data
            let jsonData = jsonString.data(using: .utf8)!

            // Setting the JSON data as the HTTP request body
            request.httpBody = jsonData

            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error with fetching data: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Error: Did not receive a valid HTTP response")
                    return
                }

                if (200...299).contains(httpResponse.statusCode) {
                    print("New row added successfully with status code: \(httpResponse.statusCode)")
                } else {
                    print("Failed to add new row with status code: \(httpResponse.statusCode)")
                }
            }

            task.resume()
            
        }
    
}
