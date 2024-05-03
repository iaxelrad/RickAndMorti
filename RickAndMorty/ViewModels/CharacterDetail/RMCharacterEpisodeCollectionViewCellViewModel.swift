//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Itamar Axelrad on 03/05/2024.
//

import Foundation

final class RMCharacterEpisodeCollectionViewCellViewModel {
    let episodeDataUrl: URL?
    
    init (episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
}

