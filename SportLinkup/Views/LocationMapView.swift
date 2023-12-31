
//  LocationMapView.swift
//  SportLinkup
//
//  Created by Raneem on 26/12/2023.
//

import SwiftUI
import CoreLocation
import MapKit

struct LocationMapView: View {
    @StateObject private var locationViewModel = LocationViewModel()
    
    @State private var pins: [SportPin] = []
    
    
    @State private var selectedPlace: Place?
    
    var body: some View {
        
        VStack{
            
            Map(coordinateRegion: $locationViewModel.region, showsUserLocation: true, annotationItems: pins) { pin in
                MapAnnotation(coordinate: .init(latitude: pin.lat, longitude: pin.lon)) {
                    Image(systemName: pin.icon)
                        .foregroundColor(.black)
                        .padding()
                        .background {
                            Circle()
                                .foregroundColor(.gray)
                        }
                        .shadow(radius: 1)
                        .onTapGesture {
                            navigate(lat: pin.lat, lon: pin.lon)
                        }
                }
                
                
            }
            
            
            .onAppear {
                locationViewModel.requestLocation()
                fetch()
            }
            .onTapGesture {
                // Get the tapped location
                let tappedLocation = locationViewModel.tappedLocation
                
                
            }
            .alert(item: $selectedPlace) { place in
                Alert(title: Text(place.title), message: Text("Latitude: \(place.coordinate.latitude)\nLongitude: \(place.coordinate.longitude)"), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private func fetch() {
        Task {
            do {
                let result: [SportPin] = try await SupabaseHelper.read(tableName: "Pins")
                pins = result
            } catch {
                print(error)
            }
        }
    }
    
    private func navigate(lat: Double, lon: Double) {
        if let url = URL(string: "comgooglemaps://?saddr=&daddr=\(lat),\(lon)&directionsmode=driving") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                return
            }
        }
        
        if let url = URL(string: "maps://?saddr=&daddr=\(lat),\(lon)") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                return
            }
        }
    }
    
}

struct Place: Identifiable {
    let id = UUID()
    let title: String
    let coordinate: CLLocationCoordinate2D
    
    func distance(to location: CLLocationCoordinate2D) -> CLLocationDistance {
        let placeLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let tappedLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        return placeLocation.distance(from: tappedLocation)
    }
}

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 24.7136, longitude: 46.6753), // Riyadh, Saudi Arabia
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    @Published var tappedLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    override init() {
        super.init()
        setupLocationManager()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            region.center = location.coordinate
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }
}

struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}


