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
        if flightModel.departureCity.cityName != "" && flightModel.arrivalCity.cityName != "" {
            flightModel.gettingData = true
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
        dismiss()
    }
    
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
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
                
                SearchBar(text: $textfield)
                    .padding([.horizontal, .bottom])
                
                ScrollView {
                    ForEach(AllAirports.filter({ Airport in
                        (departureView ? Airport.cityName != flightModel.arrivalCity.cityName : Airport.cityName != flightModel.departureCity.cityName) && (Airport.cityName.hasPrefix(textfield) || Airport.cityCode.hasPrefix(textfield))
                    })) { airport in
                        Button(action: {
                            departureView ? (flightModel.departureCity = airport) : (flightModel.arrivalCity = airport)
                            fetch()
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



struct SearchBar: View {
    
    @Binding var text: String

    var body: some View {
        HStack {
                TextField("출발지 국가, 도시 또는 공항", text: $text)
                    .foregroundColor(.primary)

                if !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                } else {
                    EmptyView()
                    
                }
            }
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            .foregroundColor(.secondary)
            .background(Color(.skyColor2))
    }
}
