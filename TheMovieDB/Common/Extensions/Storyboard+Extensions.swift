//
//  Storyboard+Extensions.swift
//  TheMovieDB
//
//  Created by Osama Bashir on 11/26/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import UIKit

extension UIStoryboard {
    enum Storyboard: String {
        case movies = "Movies"
    }

    // MARK: - Convenience Initializers

    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }

    // MARK: - View Controller Instantiation from Generics

    func initialViewController<T: UIViewController>() -> T {
        guard let viewController = instantiateInitialViewController() as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.self) ")
        }

        return viewController
    }
}
