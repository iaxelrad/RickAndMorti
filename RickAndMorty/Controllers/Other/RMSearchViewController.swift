//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Itamar Axelrad on 03/05/2024.
//

import UIKit

// Dynamic search option view
// Render results
// Render no results zero state
// Searching / API Call

/// Configure controller to search
final class RMSearchViewController: UIViewController {
    /// Configuration for search session
    struct Config {
        enum `Type` {
            case character // name | status | gender
            case episode // name
            case location // name | type

            var title: String {
                switch self {
                case .character:
                    return "Search Characters"
                case .location:
                    return "Search Locations"
                case .episode:
                    return "Search Episodes"
                }
            }
        }

        let type: `Type`
    }

    private let config: Config

    // MARK: - Init

    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = config.type.title
        view.backgroundColor = .systemBackground
    }
}
