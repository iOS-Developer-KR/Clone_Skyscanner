//
//  MainViewCenterView.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 4/5/24.
//

import SwiftUI

struct MainViewCenterView: View {
    
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                
                MainViewCenterCell(imageColor: .earth, imageBorderColor: .earthBorder, systemName: "globe.americas.fill", text: "어디든지 검색")
                
                MainViewCenterCell(imageColor: .tag, imageBorderColor: .weakSky, systemName: "bed.double.fill", text: "호텔 초특가")
                
                MainViewCenterCell(imageColor: .questionmark, imageBorderColor: .weakSky, systemName: "questionmark.circle.fill", text: "고객 지원 방법")
                
            }
        }
        
    }
}

#Preview {
    MainViewCenterView()
}
