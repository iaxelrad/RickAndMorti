//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by Itamar Axelrad on 10/05/2024.
//

import Foundation

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
