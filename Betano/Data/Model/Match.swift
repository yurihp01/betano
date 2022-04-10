//
//  Match.swift
//  Betano
//
//  Created by Yuri on 06/04/2022.
//

import Foundation

struct Match: Decodable {
    
    var playersFormatted: String {
        return players.replacingOccurrences(of: " - ", with: "\n")
    }

    let players: String
    let time: Int
    var isSelected: Bool = false
    
    init (players: String, time: Int) {
        self.players = players
        self.time = time
    }
}

extension Match {
    enum CodingKeys: String, CodingKey {
        case players = "sh"
        case time = "tt"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        players = try values.decode(String.self, forKey: .players)
        time = try values.decode(Int.self, forKey: .time)
    }
}
