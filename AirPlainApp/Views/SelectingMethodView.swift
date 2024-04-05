//
//  SelectingMethodView.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 1/30/24.
//

import SwiftUI

struct SelectingMethodView: View {
    
    @Binding var selected: Int
    
    var body: some View {
        HStack {
            Button(action: {
                selected = 1
            }, label: {
                Text("왕복")
                    .font(.footnote)
                    .foregroundStyle(selected == 1 ? .white : .gray)
            })
            Button(action: {
                selected = 2
            }, label: {
                Text("편도")
                    .font(.footnote)
                    .foregroundStyle(selected == 2 ? .white : .gray)
            })
            Button(action: {
                selected = 3
            }, label: {
                Text("다구간")
                    .font(.footnote)
                    .foregroundStyle(selected == 3 ? .white : .gray)
            })
            Spacer()
        }.padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        SelectingMethodView(selected: .constant(1))
            .environment(Navigation())
    }
}
