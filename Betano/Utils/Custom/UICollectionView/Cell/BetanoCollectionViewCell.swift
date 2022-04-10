//
//  BetanoCollectionViewCell.swift
//  Betano
//
//  Created by Yuri on 06/04/2022.
//

import UIKit

class BetanoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var teamsLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell(countdown: String, teams: String, isSelected: Bool) {
        countdownLabel.text = countdown
        teamsLabel.text = teams
        setCountdownLabel()
        setImage(isSelected: isSelected)
    }
    
    func setImage(isSelected: Bool) {
        let image = !isSelected ? UIImage(named: "star") : UIImage(named: "star.fill")
        starImage.image = image?.withRenderingMode(.alwaysTemplate)
        starImage.tintColor = isSelected ? .yellow : .white
    }
    
    func setCountdownLabel() {
        countdownLabel.layer.borderColor = UIColor.lightGray.cgColor
        countdownLabel.layer.borderWidth = 1.0
        countdownLabel.layer.cornerRadius = 12
    }
}
