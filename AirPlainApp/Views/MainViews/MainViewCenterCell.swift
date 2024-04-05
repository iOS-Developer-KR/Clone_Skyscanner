//
//  MainViewCenterCell.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 4/5/24.
//

import SwiftUI

struct MainViewCenterCell: View {
    var imageColor: Color
    var imageBorderColor: Color
    var systemName: String
    var text: String
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 25, height: 25)
                        .padding([.horizontal,.top])
                        .foregroundStyle(imageBorderColor)
                    Image(systemName: systemName)
                        .padding([.horizontal,.top])
                        .foregroundStyle(imageColor)
                }
                Spacer()
                    
            }

            HStack {
                Text(text)
                    .font(.system(size: 15))
                    .bold()
                    .lineLimit(nil)
                    .padding()
                Spacer()
            }
            
//            Spacer()
        }
        .background(.skyBlue)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .frame(width: 130, height: 100)
    }
}

#Preview {
    MainViewCenterCell(imageColor: .earth, imageBorderColor: .earthBorder, systemName: "earth", text: "최저가 여행")
}
