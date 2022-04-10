//
//  Sport.swift
//  Betano
//
//  Created by Yuri on 06/04/2022.
//

import Foundation
 
struct Sport: Decodable {
    let acronym, sport: String
    var matches: [Match]
}

extension Sport {
    enum CodingKeys: String, CodingKey {
        case acronym = "i"
        case sport = "d"
        case matches = "e"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        acronym = try values.decode(String.self, forKey: .acronym)
        sport = try values.decode(String.self, forKey: .sport)
        matches = try values.decode([Match].self, forKey: .matches)
    }
}
