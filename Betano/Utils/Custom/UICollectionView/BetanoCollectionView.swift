//
//  BetanoCollectionView.swift
//  Betano
//
//  Created by Yuri on 08/04/2022.
//

import UIKit

class BetanoCollectionView: UICollectionView {
    
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        return layout
    }()
    
    var sport: Sport?
    var betanoDelegate: BetanoDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setCollection(sport: Sport, delegate: BetanoDelegate) {
        self.sport = sport
        self.betanoDelegate = delegate
        self.collectionViewLayout = flowLayout
        setDelegation()
    }
    
    func setDelegation() {
        self.dataSource = self
        self.delegate = self
    }
}

extension BetanoCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sport?.matches.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sport = sport,
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? BetanoCollectionViewCell else { return UICollectionViewCell() }
    
        if sport.matches.count < indexPath.row {
            reloadData()
        }
        
        let match = sport.matches[indexPath.row]
        cell.setCell(countdown: match.time.formattedDate, teams: match.playersFormatted, isSelected: match.isSelected)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.sport?.matches[indexPath.row].isSelected.toggle()
        betanoDelegate?.update(sport: sport, indexPath: indexPath)
        reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 150, height: 150)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        betanoDelegate?.reloadTableData()
    }
}
