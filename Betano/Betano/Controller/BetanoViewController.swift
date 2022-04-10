//
//  BetanoViewController.swift
//  Betano
//
//  Created by Yuri on 06/04/2022.
//

import UIKit

class BetanoViewController: UIViewController, Storyboarded {

    @IBOutlet weak var tableView: BetanoTableView!
    
    weak var coordinator: BetanoCoordinator?
    var viewModel: BetanoViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigation()
        getSports()
        title = "Betano"
    }
}

private extension BetanoViewController {
    func setNavigation() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 35/255, green: 43/255, blue: 54/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        if #available(iOS 15, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]
            navigationBarAppearance.backgroundColor = UIColor(red: 35/255, green: 43/255, blue: 54/255, alpha: 1)
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        
            let tabBarApperance = UITabBarAppearance()
            tabBarApperance.configureWithOpaqueBackground()
            tabBarApperance.backgroundColor = UIColor(red: 35/255, green: 43/255, blue: 54/255, alpha: 1)
            UITabBar.appearance().scrollEdgeAppearance = tabBarApperance
            UITabBar.appearance().standardAppearance = tabBarApperance
        }
    }
    
    func getSports() {
        viewModel?.getSports(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let sports):
                DispatchQueue.main.async {
                    self.tableView.setDelegation(sports: sports)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    let alert = UIAlertController.showAlertDialog(title: "Error", message: error.localizedDescription)
                    self.present(alert, animated: true)
                }
            }
        })
    }
}

