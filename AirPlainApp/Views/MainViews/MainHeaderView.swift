//
//  MainHeaderView.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 4/5/24.
//

import SwiftUI

struct MainHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "sun.horizon")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Text("Incheon Airport Project")
                .font(.title)
                .bold()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    MainHeaderView()
}
