//
//  CurrentFlightData.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 1/30/24.
//

import Foundation

struct IncheonResponse: Decodable {
    let response: IncheonBody
}

struct IncheonBody: Decodable {
    let header: IncheonHeader
    let body: IncheonItems
}

struct IncheonHeader: Decodable {
    let resultCode: String
    let resultMsg: String
}

struct IncheonItems: Decodable {
    let items: [IncheonItem]
    
}

struct IncheonItem: Decodable, Hashable {
    let typeOfFlight: String?
    let airline: String?
    let flightId: String?
    let scheduleDateTime: String?
    let estimatedDateTime: String?
    let airport: String?
    let gatenumber: String?
    let carousel: String?
    let exitnumber: String?
    let remark: String?
    let codeshare: String?
    let masterflightid: String?
    let airportCode: String?
    let cityCode: String?
    let terminalId: String?
    let firstopover: String?
    let firstopovername: String?
    let secstopover: String?
    let secstopovername: String?
    let thistopover: String?
    let thistopovername: String?
    let elapsetime: String?
}
