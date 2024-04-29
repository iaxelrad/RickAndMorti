//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Itamar Axelrad on 28/04/2024.
//

import Foundation

/// Object that represents a single API Call
final class RMRequest {

    // Base url
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }

    // Endpoint
    private let endpoint: RMEndpoint

    // Path components
    private let pathComponents: [String]

    // Query parameters
    private let queryParameters: [URLQueryItem]


    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue

        if !pathComponents.isEmpty {
            string += "/"
            pathComponents.forEach({
                string += "\($0)"
            })
        }

        if !queryParameters.isEmpty {
            string += "?"
            //name=value&name=value
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")

            string += argumentString
        }

        return string
    }

    public var url: URL? {
        return URL(string: urlString)
    }

    // MARK: - Public

    init(
        endpoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
