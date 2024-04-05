//
//  MainHeaderView.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 4/5/24.
//

import SwiftUI

struct MainSectionView: View {
    @Environment(Navigation.self) var navigationPath
    
    var body: some View {
        HStack {
            NavigationLink {
                FlightViewContainer()
            } label: {
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.sky)
                        Image(systemName: "airplane")
                            .foregroundStyle(.black)
                    }
                    Text("항공권")
                        .foregroundStyle(.white)
                }
            }

            .padding()
            
            NavigationLink {
                
            } label: {
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.sky)
                        Image(systemName: "bed.double.fill")
                            .foregroundStyle(.black)
                    }
                    Text("호텔")
                        .foregroundStyle(.white)
                }
            }
            .padding()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.sky)
                        Image(systemName: "car")
                            .foregroundStyle(.black)
                    }
                    Text("랜터카")
                        .foregroundStyle(.white)
                }
            })
            .padding()
        }
        .navigationDestination(for: String.self) { des in
            //            if des == "FlightViewContainer" {
            FlightViewContainer()
            //            }
        }
    }
}



#Preview {
//    @Environment(Navigation.self) var navigationPath

//    @Bindable var path = navigationPath
    NavigationStack() {
        MainSectionView()
            .environment(FlightInfoModel())
            .environment(Navigation())
    }
}
