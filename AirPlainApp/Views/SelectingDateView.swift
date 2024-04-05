//
//  SelectingDateView.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 1/30/24.
//

import SwiftUI

struct SelectingDateView: View {
    
    @State var departure = ""
    @State var arrival = ""
    
    var body: some View {
        HStack {
            TextField("출발날짜", text: $departure)
                .textFieldStyle(CustomTextfieldStyle())
            
            TextField("도착날짜", text: $departure)
                .textFieldStyle(CustomTextfieldStyle())
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    SelectingDateView()
}
