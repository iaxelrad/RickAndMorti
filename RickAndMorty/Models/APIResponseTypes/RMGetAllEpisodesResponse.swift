//
//  RMGetAllEpisodesResponse.swift
//  RickAndMorty
//
//  Created by Itamar Axelrad on 03/05/2024.
//

import Foundation

import Foundation

struct RMGetAllEpisodesResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMEpisode]
}
