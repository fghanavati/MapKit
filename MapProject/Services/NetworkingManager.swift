//
//  NetworkingManager.swift
//  MapProject
//
//  Created by Fatemeh Ghanavati  on 02/02/2022.
//

import Foundation
import Alamofire


class NetworkingManager {
    typealias jsonServices = (Data?, Error?) -> Void
    func postRequest(url: URLConvertible, parameters: [String: Any]? = nil, headers: HTTPHeaders? = nil, completion: @escaping jsonServices) {
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).validate().responseData { response in
            
            if let data = response.data, let printableResponse = String(data: data, encoding: .utf8) {
                print(printableResponse)
            }
            
            if let error = response.error {
                completion(response.data, error)
            } else if let data = response.data {
                completion(data, nil)
            }
        }
    }
    
    
    func getRequest(url: URLConvertible, headers: HTTPHeaders? = nil, completion: @escaping jsonServices) {
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: nil).validate().responseJSON { response in
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print(utf8Text)
            }
            if let error = response.error {
                completion(response.data, error)
            } else if let data = response.data {
                completion(data, nil)
            }
        }
    }
}
