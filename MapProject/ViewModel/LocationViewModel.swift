//
//  LocationViewModel.swift
//  MapProject
//
//  Created by Fatemeh Ghanavati  on 02/02/2022.
//

import UIKit
import Alamofire
import MapKit

typealias LocationInformation = (NearbyPlaces?, ErrorModel?) -> Void
protocol LocationInformationProtocol {
    
    func getLocation(completion: @escaping LocationInformation)
    
}


class LocationViewModel : ObservableObject {
    let services = NetworkingManager()
    
}

extension LocationViewModel: LocationInformationProtocol {
    func getLocation(completion: @escaping LocationInformation) {
        let url = URL(string:
                      "https://api.foursquare.com/v3/places/nearby?ll=52.500342%2C13.425170")
        services.getRequest(url: url!, headers: HTTPHeaders([.authorization("fsq3lmzftGFdHnD7VrCXAkcW+hgzOsJ5Ra4E212rASQYoFI=")])) { response, error in
            if error == nil {
                do {
                    if let data = response {
                        let decoded = try JSONDecoder().decode(NearbyPlaces.self, from: data)
                        completion(decoded, nil)
                    }
                } catch {
                    completion(nil, ErrorModel(title: "Error", message: "Failed to decode data"))
                }
            } else {
                completion(nil, ErrorModel(title: "Error", message: error?.localizedDescription))
            }
        }
    }
}
