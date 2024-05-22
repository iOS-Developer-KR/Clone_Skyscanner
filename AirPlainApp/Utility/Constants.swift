//
//  Constants.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 1/30/24.
//

import Foundation

struct IncheonConstData {
    
    let apiKey = "QwqfirLFUeoEN2PegJzjiJwErZFgYD%2FlavNL6Lthk7kYmqnzCC7i3BjMmcsSaRDGayGkOl%2B3%2BaDwn5y34t%2Bb2A%3D%3D"
    // 출발 링크
    let arriveURL = URL(string: "http://apis.data.go.kr/B551177/StatusOfPassengerFlightsOdp/getPassengerArrivalsOdp?serviceKey=QwqfirLFUeoEN2PegJzjiJwErZFgYD%2FlavNL6Lthk7kYmqnzCC7i3BjMmcsSaRDGayGkOl%2B3%2BaDwn5y34t%2Bb2A%3D%3D&from_time=0000&to_time=2400&lang=K&type=json")
    // 도착 링크
    let departureURL = URL(string: "http://apis.data.go.kr/B551177/StatusOfPassengerFlightsOdp/getPassengerDeparturesOdp?serviceKey=QwqfirLFUeoEN2PegJzjiJwErZFgYD%2FlavNL6Lthk7kYmqnzCC7i3BjMmcsSaRDGayGkOl%2B3%2BaDwn5y34t%2Bb2A%3D%3D&from_time=0000&to_time=2400&lang=K&type=json")

}
