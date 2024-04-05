//
//  SelectingDestinationView.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 1/30/24.
//

import SwiftUI
import CoreLocation

struct CustomTextfieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        // 텍스트필드
        configuration
            .textFieldStyle(.roundedBorder)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .border(Color.black, width: 0.5)
            .disabled(true)
    }
}

struct SelectingDestinationView: View {
    @Environment(FlightInfoModel.self) var flightModel
    @State var depaturePressed = false
    @State var arrivalPressed = false
    @Binding var departureView: Bool
    var FlightVM = FlightStateViewModel()
    
    var body: some View {
        @Bindable var flightModel = flightModel
        HStack {
            TextField("", text: $flightModel.departureCity.cityName, prompt: Text("출발지를 지정하세요"))
                .textFieldStyle(CustomTextfieldStyle())
                .foregroundStyle(Color.white)
                .contentShape(Rectangle())
                .onTapGesture {
                    depaturePressed = true
                }
            
            TextField("", text: $flightModel.arrivalCity.cityName, prompt: Text("도착지를 지정하세요"))
                .textFieldStyle(CustomTextfieldStyle())
                .foregroundStyle(Color.white)
                .contentShape(Rectangle())
                .onTapGesture {
                    arrivalPressed = true
                }
        }
        .padding(.horizontal)
        .overlay(alignment: .center) {
            Button(action: {
                departureView.toggle()
                if $flightModel.arrivalCity.cityCode.wrappedValue != "" && $flightModel.departureCity.cityCode.wrappedValue != "" {
                    flightModel.gettingData = true
                    if departureView {
                        FlightVM.FetchData(url: IncheonConstData().departureURL!) { result in
                            flightModel.flights = result?.response.body.items
                            flightModel.gettingData = false
                        }
                    } else {
                        FlightVM.FetchData(url: IncheonConstData().arriveURL!) { result in
                            flightModel.flights = result?.response.body.items
                            flightModel.gettingData = false
                        }
                    }
                }
            }, label: {
                Image(systemName: departureView ? "arrowshape.right.circle.fill" : "arrowshape.backward.circle.fill")
                    .renderingMode(.original)
                    .font(.system(size: 20))
            })
        }
        .sheet(isPresented: $depaturePressed, onDismiss: {
            depaturePressed = false
        }, content: {
            FindingAirportView(departureView: true)
        })
        .sheet(isPresented: $arrivalPressed, onDismiss: {
            arrivalPressed = false
        }, content: {
            FindingAirportView(departureView: false)
        })
        
    }
}

#Preview {
    NavigationStack {
        SelectingDestinationView(departureView: .constant(true))
            .environment(FlightInfoModel())
            .environment(Navigation())
    }

}
