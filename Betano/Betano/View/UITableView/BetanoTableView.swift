//
//  BetanoTableView.swift
//  Betano
//
//  Created by Yuri on 06/04/2022.
//

import UIKit

protocol BetanoDelegate {
    func update(sport: Sport?, indexPath: IndexPath)
    func reloadTableData()
}

class BetanoTableView: UITableView {
    var sports: [Sport] = []
    var hiddenSections = Set<Int>()
    
    init() {
        super.init(frame: .zero, style: .plain)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setDelegation(sports: [Sport]) {
        self.sports = sports
        delegate = self
        dataSource = self
        rowHeight = 150
    }
}

extension BetanoTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hiddenSections.contains(section) ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as? BetanoTableViewCell else { return UITableViewCell() }
        let sport = sports[indexPath.section]
        cell.setCollectionView(sport: sport, delegate: self)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sports.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "icons8up"), for: .normal)
        button.tag = section
        button.addTarget(self, action: #selector(self.hideSection(sender:)), for: .touchUpInside)
        
        let header = UITableViewHeaderFooterView()
        header.textLabel?.textColor = .white
        header.textLabel?.tintColor = UIColor(red: 35/255, green: 43/255, blue: 54/255, alpha: 1.0)
        header.addSubview(button)
        header.textLabel?.text = sports[section].sport
        
        
        NSLayoutConstraint.activate([
            button.rightAnchor.constraint(equalTo: header.rightAnchor, constant: -24),
            button.centerYAnchor.constraint(equalTo: header.centerYAnchor)
        ])
        return header
    }

    
    @objc private func hideSection(sender: UIButton) {
        let section = sender.tag
        
        func indexPathsForSection() -> [IndexPath] {
            var indexPaths = [IndexPath]()
            
            for row in 0..<1 {
                indexPaths.append(IndexPath(row: row, section: section))
            }
            
            return indexPaths
        }
        
        if self.hiddenSections.contains(section) {
            self.hiddenSections.remove(section)
            sender.setImage(UIImage(named: "icons8up"), for: .normal)
            insertRows(at: indexPathsForSection(),
                                      with: .fade)
            
        } else {
            self.hiddenSections.insert(section)
            sender.setImage(UIImage(named: "icons8"), for: .normal)
            deleteRows(at: indexPathsForSection(),
                                      with: .fade)
        }
    }
}

extension BetanoTableView: BetanoDelegate {
    func update(sport: Sport?, indexPath: IndexPath) {
        guard let sport = sport else {
            return
        }

        sports[indexPath.section] = sport
    }
    
    func reloadTableData() {
        reloadData()
    }
}
