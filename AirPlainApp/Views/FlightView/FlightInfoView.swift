//
//  FlightButtonView.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 2/2/24.
//

import SwiftUI
import Lottie

struct FlightInfoView: View {
    @Environment(FlightInfoModel.self) var flightModel
    var flight: IncheonItem!

    
    var body: some View {
        Button(action: {}, label: {
            VStack {
                
                HStack {
                    Text(flightModel.departureCity.cityCode + "-" + flightModel.arrivalCity.cityCode)

                    Spacer()
                }
                
                HStack {
                    Text(flight.airline ?? "미지정")
                    Text(flight.flightId ?? "미지정")
                    
                    Spacer()
                }
                
                HStack {
                    Text("에정시간:" + (flight.scheduleDateTime ?? ""))
                    if flight.elapsetime != nil {
                        Image(systemName: "arrowshape.forward")
                        Text("변경후:" + (flight.estimatedDateTime ?? ""))
                    }
                    Spacer()
                }

                HStack {
                    Text("터미널:" + (flight.terminalId ?? "미지정"))
                    Text("탑승구:" + (flight.gatenumber ?? "미지정"))
                    Spacer()
                    
                }
            }
            .padding(.all)

        })
        .foregroundStyle(Color.white)
    }
}

#Preview {
    FlightInfoView()
        .environment(FlightInfoModel())
}
