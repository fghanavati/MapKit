//
//  LocationModel.swift
//  MapProject
//
//  Created by Fatemeh Ghanavati  on 02/02/2022.
//

import Foundation



struct NearbyPlaces : Codable {
    let results : [Results]?

    enum CodingKeys: String, CodingKey {

        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([Results].self, forKey: .results)
    }

}


struct Results : Codable {
    let fsq_id : String?
    let categories : [Categories]?
    let chains : [String]?
    let distance : Int?
    let geocodes : Geocodes?
    let location : Location?
    let name : String?
  //  let related_places : Related_places?
    let timezone : String?

    enum CodingKeys: String, CodingKey {

        case fsq_id = "fsq_id"
        case categories = "categories"
        case chains = "chains"
        case distance = "distance"
        case geocodes = "geocodes"
        case location = "location"
        case name = "name"
     //   case related_places = "related_places"
        case timezone = "timezone"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        fsq_id = try values.decodeIfPresent(String.self, forKey: .fsq_id)
        categories = try values.decodeIfPresent([Categories].self, forKey: .categories)
        chains = try values.decodeIfPresent([String].self, forKey: .chains)
        distance = try values.decodeIfPresent(Int.self, forKey: .distance)
        geocodes = try values.decodeIfPresent(Geocodes.self, forKey: .geocodes)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    //    related_places = try values.decodeIfPresent(Related_places.self, forKey: .related_places)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
    }

}




struct Categories : Codable {
    let id : Int?
    let name : String?
    let icon : Icon?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case icon = "icon"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        icon = try values.decodeIfPresent(Icon.self, forKey: .icon)
    }

}


struct Icon : Codable {
    let prefix : String?
    let suffix : String?

    enum CodingKeys: String, CodingKey {

        case prefix = "prefix"
        case suffix = "suffix"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        prefix = try values.decodeIfPresent(String.self, forKey: .prefix)
        suffix = try values.decodeIfPresent(String.self, forKey: .suffix)
    }

}




struct Geocodes : Codable {
    let main : Main?

    enum CodingKeys: String, CodingKey {

        case main = "main"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        main = try values.decodeIfPresent(Main.self, forKey: .main)
    }

}


struct Main : Codable {
    let latitude : Double?
    let longitude : Double?

    enum CodingKeys: String, CodingKey {

        case latitude = "latitude"
        case longitude = "longitude"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
    }

}



struct Location : Codable {
    let address : String?
    let country : String?
    let locality : String?
    let postcode : String?
    let region : String?

    enum CodingKeys: String, CodingKey {

        case address = "address"
        case country = "country"
        case locality = "locality"
        case postcode = "postcode"
        case region = "region"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        locality = try values.decodeIfPresent(String.self, forKey: .locality)
        postcode = try values.decodeIfPresent(String.self, forKey: .postcode)
        region = try values.decodeIfPresent(String.self, forKey: .region)
    }

}


//
//struct Related_places : Codable {
//
//    enum CodingKeys: String, CodingKey {
//
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//    }
//
//}
//
//
