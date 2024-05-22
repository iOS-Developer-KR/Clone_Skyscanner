//
//  FlightStateViewModel.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 1/30/24.
//

import Foundation
import SwiftUI
import Alamofire

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class FlightStateViewModel {
    
    func FetchData(url: URL, completion: @escaping (IncheonResponse?) -> Void) {
        AF.request(url, method: .get).responseDecodable(of: IncheonResponse.self) { response in
            switch response.result {
            case .success(let data):
                return completion(data)
            case .failure:
                return completion(nil)
            }
        }
    }
}
