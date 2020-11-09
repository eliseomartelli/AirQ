//
//  Data.swift
//  AirQ
//
//  Created by Eliseo Martelli on 09/11/20.
//

import Foundation
import Combine
import CoreLocation

class HomeViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var data: DataWrapper = DataWrapper(results: [])
    @Published var lat: Double = 0
    @Published var long: Double = 0

    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func fetch() -> Void {
        let url = "https://api.openaq.org/v1/latest/?coordinates=\(lat),\(long)&radius=100000&order_by=distance&limit=1"
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data, _, _) in
            guard let JSONData = data else { return }
            
            do {
                let returnedData = try JSONDecoder().decode(DataWrapper.self, from: JSONData)
                
                DispatchQueue.main.async {
                    self.data = returnedData
                }
                
            } catch {
                print(error)
            }
        }.resume()
    }
}

extension HomeViewModel {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        lat = location.coordinate.latitude
        long = location.coordinate.longitude
        
        fetch()
    }
}
