//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Itamar Axelrad on 29/04/2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views:UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

extension UIDevice {
    static let isIphone = UIDevice.current.userInterfaceIdiom == .phone
}
