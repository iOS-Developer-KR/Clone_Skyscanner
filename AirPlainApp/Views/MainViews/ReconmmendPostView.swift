//
//  ReconmmendPostView.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 4/5/24.
//

import SwiftUI

struct ReconmmendPostView: View {
    
    var imageName: String
    var title: String
    var detail: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay(alignment: .bottom) {
                VStack {
                    HStack {
                        Text(title)
                            .bold()
                            .font(.title)
                            .padding(.horizontal)
                        Spacer()
                    }
                    HStack {
                        Text(detail)
                            .padding([.horizontal, .bottom])
                        Spacer()
                    }
                }
            }
            .padding([.top])
            
    }
}

#Preview {
    ReconmmendPostView(imageName: "SanFrancisco1", title: "어디로 떠나볼까요?", detail: "iOS-Deveolper의 여행 전문가들이 여행을 만끽하기 좋은 여행지를 추천해 드립니다")
}
