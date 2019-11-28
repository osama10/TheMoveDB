//
//  AppNavigator.swift
//  TheMovieDB
//
//  Created by Osama Bashir on 11/26/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import UIKit

protocol AppNavigatorProtocol {
    func installRoot(in window: UIWindow)
}

struct AppNavigator { //: AppNavigatorProtocol {

    func installRoot(into window: UIWindow) {
        // controller create & setup
        let storyboard = UIStoryboard(storyboard: .movies)
        let movieListController: MovieListViewController = storyboard.initialViewController()
        let rootController = AppNavigationController(rootViewController: movieListController)

        //View Model create & setup
        let remoteDataSource = MoviesRemoteDataStore()
        let localDataSource = MoviesLocalDataSource()
        let repository = MoviesRepository(remoteMoviesDataSource: remoteDataSource, localMoviesDataSource: localDataSource)
        let service = MoviesService(moviesRepository: repository)
        let navigator = MoviesListNavigator(navigationController: rootController)
        let viewModel = MoviesListViewModel(moviesService: service, navigator: navigator)

        remoteDataSource.delegate = repository
        repository.delegate = service
        service.delegate = viewModel
        viewModel.delegate = movieListController

        movieListController.viewModel = viewModel

        window.rootViewController = rootController
    }
}
