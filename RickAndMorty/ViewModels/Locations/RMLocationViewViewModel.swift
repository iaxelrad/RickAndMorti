//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Itamar Axelrad on 07/05/2024.
//

import Foundation

protocol RMLocationViewViewModelDelegate: AnyObject {
    func didFetchInitialLocations()
}

final class RMLocationViewViewModel {

    weak var delegate: RMLocationViewViewModelDelegate?

    private var locations: [RMLocation] = [] {
        didSet {
            for location in locations {
                let cellViewModel = RMLocationTableViewCellViewModel(location: location)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }

    //Location response info
    //Will contain next url, if present
    private var apiInfo: RMGetAllLocationsResponse.Info?

    public var cellViewModels: [RMLocationTableViewCellViewModel] = []

    init() {}

    public func fetchLocations () {
       RMService.shared.execute(
            .listLocationsRequests, expecting: RMGetAllLocationsResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let model):
                self?.apiInfo = model.info
                self?.locations = model.results
                DispatchQueue.main.async {
                    self?.delegate?.didFetchInitialLocations()
                }
            case .failure:
                break
            }
        }
    }

    private var hasMoreResults: Bool {
        return false
    }
}
