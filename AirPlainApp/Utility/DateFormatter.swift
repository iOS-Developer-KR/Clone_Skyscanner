//
//  DateFormatter.swift
//  AirPlainApp
//
//  Created by Taewon Yoon on 4/5/24.
//

import Foundation

let dateformat: DateFormatter = {
      let formatter = DateFormatter()
       formatter.dateFormat = "YYYY년 M월 d일"
       return formatter
}()
