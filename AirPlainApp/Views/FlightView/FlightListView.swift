//
//  FlightListView.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 1/30/24.
//

import SwiftUI
import CoreLocation
import Lottie

struct FlightListView: View {
    
    @Environment(FlightInfoModel.self) var flightModel
    @Binding var departureView: Bool
    var FlightVM = FlightStateViewModel()
//    private let animationView = LottieView(jsonName: "animation.json")
    
    
    var body: some View {
        Spacer()
        ZStack {
            if flightModel.gettingData {
                LottieView(animation: .named("animation.json"))
                    .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
            } else {
                VStack {
                    if let flights = flightModel.flights {
                        ScrollView {
                            HStack {
                                Text((departureView ? "인천" : flightModel.arrivalCity.cityName) + "도착 항공편")
                                    .padding(.horizontal)
                                    .font(.title2)
                                    .bold()
                                Spacer()
                            }
                            ForEach(flights, id: \.self) { flight in

                                FlightInfoView(flight: flight)
                                Divider()
                                
                            }
                        }
                    } else {
                        if flightModel.departureCity.cityName != "" && flightModel.arrivalCity.cityName != "" {
                            VStack {
                                Spacer()
                                Text("Loading...")
                                Spacer()
                            }
                        }
                    }
                }
            }//VSTACK
        }
    }//ZSTACK
}

#Preview {
    NavigationStack {
        FlightListView(departureView: .constant(true))
            .environment(FlightInfoModel())
            .environment(Navigation())
    }
}
