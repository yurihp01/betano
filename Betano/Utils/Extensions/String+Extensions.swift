//
//  String+Extensions.swift
//  Betano
//
//  Created by Yuri on 08/04/2022.
//

import Foundation

extension Int {
    var formattedDate: String {
        let date = Date.init(timeIntervalSinceNow: TimeInterval(self)/1000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss"
        return dateFormatter.string(from: date)
    }
}
