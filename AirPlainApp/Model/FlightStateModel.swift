//
//  FlightStateModel.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 1/30/24.
//

import Foundation

struct FlightStateModel {
    var schStTime: String
    var schEdTime: String
    var schLineType: String
    var schIOType: String
    var schAirCode: String
    var pageNo: String
    let DCurrentDeparture =
    "http://openapi.airport.co.kr/service/rest/FlightStatusList/getFlightStatusList?ServiceKey=QwqfirLFUeoEN2PegJzjiJwErZFgYD%2FlavNL6Lthk7kYmqnzCC7i3BjMmcsSaRDGayGkOl%2B3%2BaDwn5y34t%2Bb2A%3D%3D&schStTime=0600&schEdTime=1800&schLineType=D&schIOType=O&schAirCode=PUS&pageNo="
    
    let url = "https://api.odcloud.kr/api/FlightStatusListDTL/v1/getFlightStatusListDetail?page=1&perPage=10&serviceKey=QwqfirLFUeoEN2PegJzjiJwErZFgYD%2FlavNL6Lthk7kYmqnzCC7i3BjMmcsSaRDGayGkOl%2B3%2BaDwn5y34t%2Bb2A%3D%3D"
}
