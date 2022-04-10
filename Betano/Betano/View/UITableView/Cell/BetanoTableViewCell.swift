//
//  BetanoTableViewCell.swift
//  Betano
//
//  Created by Yuri on 06/04/2022.
//

import UIKit

class BetanoTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: BetanoCollectionView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(style: .default, reuseIdentifier: "tableCell")
    }
    
    func setCollectionView(sport: Sport, delegate: BetanoDelegate) {
        collectionView.setCollection(sport: sport, delegate: delegate)
    }
}
