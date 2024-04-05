//
//  MainView.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 4/5/24.
//

import SwiftUI

struct MainViewContainer: View {
    let path = Navigation()

    var body: some View {
        @Bindable var path = Navigation()
        NavigationStack(path: $path.path) {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    
                    MainHeaderView()
                    
                    MainSectionView()
                        .padding()
                    MainViewCenterView()
                    
                    ReconmmendPostView(imageName: "SanFrancisco1", title: "어디로 떠나볼까요?", detail: "iOS-Deveolper의 여행 전문가들이 여행을 만끽하기 좋은 여행지를 추천해 드립니다")
                    
                    Spacer()
                }
            }
            
        }
    }
}

#Preview {
    MainViewContainer()
        .environment(Navigation())

}
