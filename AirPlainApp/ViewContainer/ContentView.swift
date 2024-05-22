//
//  ContentView.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 1/30/24.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    
    var body: some View {
        MainViewContainer()
    }
}

#Preview {
    ContentView()
        .environment(FlightInfoModel())

}
