//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Itamar Axelrad on 03/05/2024.
//

import UIKit

protocol RMEpisodeDetailViewViewModelDelegate: AnyObject {
    func didFetchEpisodeDetails()
}

final class RMEpisodeDetailViewViewModel {
    private let endpointUrl: URL?
    private var dataTuple: (RMEpisode, [RMCharacter])? {
        didSet {
            delegate?.didFetchEpisodeDetails()
        }
    }

    public weak var delegate: RMEpisodeDetailViewViewModelDelegate?

    // MARK: - Public
    
    // MARK: - Private


    // MARK: - Init

    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
    }

    /// Fetch backing episode model
    public func fetchEpisodeData() {
        guard let url = endpointUrl,
              let request = RMRequest(url: url) else {
            return
        }

        RMService.shared.execute(request,
                                 expecting: RMEpisode.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.fetchRelatedCharacters(episode: model)
            case .failure:
                break
            }
        }
    }
    
    public func fetchRelatedCharacters(episode: RMEpisode) {
//        let characterUrls: [URL] = episode.characters.compactMap({
//            return URL(string: $0)
//        })
//        let requests: [RMRequest] = characterUrls.compactMap({
//            return RMRequest(url: $0)
//        })

        // shorthand way for the above commented out code to batch requests
        let requests: [RMRequest] = episode.characters.compactMap({
            return URL(string: $0)
        }).compactMap({
            return RMRequest(url: $0)
        })

        // 10 of parallel requests
        // Notified once all done

        let group = DispatchGroup()
        var characters: [RMCharacter] = []
        for request in requests {
            group.enter()
            RMService.shared.execute(request, expecting: RMCharacter.self) { result in
                defer {
                    group.leave()
                }

                switch result {
                case .success(let model):
                    characters.append(model)
                case .failure(let failure):
                    break
                }
            }
        }

        group.notify(queue: .main) {
            self.dataTuple = (
                episode,
                characters
            )
        }
    }
}
