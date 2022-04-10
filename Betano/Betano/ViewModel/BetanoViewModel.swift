//
//  BetanoViewModel.swift
//  Betano
//
//  Created by Yuri on 06/04/2022.
//

import Foundation

protocol BetanoViewModelProtocol {
    func getSports(completion: @escaping (Result<[Sport], BetanoError>) -> ())
}

class BetanoViewModel {
    let service: BetanoServiceProtocol
    
    init () {
        service = BetanoService()
        print("INIT: BetanoViewModel")
    }
    
    deinit {
        print("DEINIT: BetanoViewModel")
    }
}

extension BetanoViewModel: BetanoViewModelProtocol {
    func getSports(completion: @escaping (Result<[Sport], BetanoError>) -> ()) {
        service.getSports { result in
            completion(result)
        }
    }
}
