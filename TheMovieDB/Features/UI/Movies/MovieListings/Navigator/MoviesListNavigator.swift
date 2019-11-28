//
//  MoviesListNavigator.swift
//  TheMovieDB
//
//  Created by Osama Bashir on 11/26/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import UIKit

protocol MoviesListNavigatorProtocol {
    func navigateToDetail(with movie: MovieDTO)
}


class MoviesListNavigator: MoviesListNavigatorProtocol {
    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func navigateToDetail(with movie: MovieDTO) {
        print(movie)
        // controller create & setup
//        let storyboard = UIStoryboard(storyboard: .movieDetail)
//        let movieDetailController: MovieDetailViewController = storyboard.initialViewController()
//
//        //View Model create & setup
//        movieDetailController.viewModel = MovieDetailViewModel(movie: movie)
//
//
//        navigationController?.pushViewController(movieDetailController, animated: true)
    }

}
