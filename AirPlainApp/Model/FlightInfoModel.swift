//
//  FlightInfoModel.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 4/5/24.
//

import Foundation

@Observable
class FlightInfoModel {
    var flights: [IncheonItem]?
    var departureCity: Airport
    var arrivalCity: Airport
    var gettingData: Bool = false
    
    init() {
        self.flights = []
        self.departureCity = Airport()
        self.arrivalCity = Airport()
    }
}
