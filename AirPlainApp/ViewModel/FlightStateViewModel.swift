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
    
//    @Published var flights: [IncheonItem]?
//    @Published var swichbtn = false
//    @Published var gettingitem = false
    
//    func FetchData(url: URL) {
////        gettingitem = true
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            print(url)
//            if let data = data {
//                do {
//                    let jsonData = try JSONDecoder().decode(IncheonResponse.self, from: data)
//                    DispatchQueue.main.sync {
//                        self.flightModel.flights = jsonData.response.body.items
////                        self.gettingitem = false
////                        self.swichbtn = true
//                    }
//                    print(self.flightModel.flights?.first?.flightId ?? "흠")
//                } catch {
//                    print("decode하는데 에러가 발생함\(error)")
//                }
//            }
//        }
//        task.resume()
//    }

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
