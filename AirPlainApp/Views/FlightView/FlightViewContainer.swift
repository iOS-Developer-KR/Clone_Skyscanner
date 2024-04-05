//
//  FlightViewContainer.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 4/5/24.
//

import SwiftUI

struct FlightViewContainer: View {
    @Environment(FlightInfoModel.self) var flightModel
    @State private var textfield: String = ""
    @State private var pressed = true
    @State private var selected = 1
    @State var departureView = true
    
    var body: some View {
        NavigationStack {
            VStack {
                SelectingMethodView(selected: $selected)
                SelectingDestinationView(departureView: $departureView)
//                if !departure.cityCode.isEmpty && !arrival.cityCode.isEmpty {
                    FlightListView(departureView: $departureView)
//                }
                Spacer()
            }
        }
    }
}

#Preview {
    NavigationStack {
        FlightViewContainer()
            .environment(FlightInfoModel())
            .environment(Navigation())
    }
}
