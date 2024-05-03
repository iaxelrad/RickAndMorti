//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Itamar Axelrad on 03/05/2024.
//

import Foundation

final class RMCharacterInfoCollectionViewCellViewModel {
    private let value: String
    private let title: String

    init (
        value: String,
        title: String)
    {
        self.value = value
        self.title = title
    }
}
