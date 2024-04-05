//
//  AirPlainAppApp.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 1/30/24.
//

import SwiftUI

@main
struct AirPlainAppApp: App {
    @State private var flightinfoModel = FlightInfoModel()
    @State private var path = Navigation()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(flightinfoModel)
                .environment(path)
        }
    }
}
