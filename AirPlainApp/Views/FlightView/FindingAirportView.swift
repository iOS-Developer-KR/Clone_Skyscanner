//
//  FindingAirportView.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 1/30/24.
//

import SwiftUI
import CoreLocation

struct FindingAirportView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(FlightInfoModel.self) var flightModel
    @State private var textfield: String = ""
    var flightVM = FlightStateViewModel()
    var departureView: Bool
    
    func fetch() {
        print("가져오기 시도")
        if flightModel.departureCity.cityName != "" && flightModel.arrivalCity.cityName != "" {
            flightModel.gettingData = true
            print("가져오기")
            if departureView {
                flightVM.FetchData(url: IncheonConstData().departureURL!) { result in
                    if let data = result?.response.body.items {
                        flightModel.flights = data
                        flightModel.gettingData = false
                    }
                }
            } else {
                flightVM.FetchData(url: IncheonConstData().arriveURL!) { result in
                    if let data = result?.response.body.items {
                        flightModel.flights = data
                        flightModel.gettingData = false
                    }
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.white)
                    })
                    Spacer()
                }.padding(.horizontal)
                
                HStack {
                    Text(departureView ? "어디서 출발하시나요?" : "어디로 가시나요?")
                        .font(.title)
                    Spacer()
                }.padding()
                
                TextField("국가, 도시 또는 공항", text: $textfield)
                    .padding([.horizontal, .bottom])
                
                ScrollView {
                    ForEach(AllAirports.filter({ Airport in
                        // 만약 출발하는 곳이라면 전체 공항에서 도착 공항이랑 같으면 안된다                             만약 도착하는 곳이라면 출발하는 곳과 같으면 안된다
                        departureView ? Airport.cityName != flightModel.arrivalCity.cityName : Airport.cityName != flightModel.departureCity.cityName
                    })) { airport in
                        Button(action: {
                            departureView ? (flightModel.departureCity = airport) : (flightModel.arrivalCity = airport)
                            fetch()
                            dismiss()
                        }, label: {
                            VStack {
                                HStack {
                                    Text(airport.cityName + " (" + airport.code + ")")
                                        .font(.title3)
                                        .bold()
                                        .foregroundStyle(Color.white)
                                        .padding(.bottom, 3)
                                    Spacer()
                                }
                                HStack {
                                    Text(airport.countryName).font(.caption).foregroundStyle(.gray)
                                    Spacer()
                                }
                            }.padding(.horizontal)
                        })
                        Divider()
                        
                    }
                }
                
            }.padding(.vertical, 20)
            // VSTACK
        } // ZSTACK
        
    }
}

#Preview {
    FindingAirportView(departureView: false)
        .environment(FlightInfoModel())
}
