//
//  MovieListsSnapshotTests.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import FBSnapshotTestCase
@testable import TheMovieDB

class MovieListsSnapshotTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
    }

    func testWhenThereData() {
        let storyboard = UIStoryboard(storyboard: .movies)
        let movieListController: MovieListViewController = storyboard.instantiateViewController()
        let cellViewModel = getMovieListCellViewModel(count: 20)
        let viewModel = MockMovieListViewModel(movieListCellViewModel: cellViewModel)
        viewModel.delegate = movieListController
        movieListController.viewModel = viewModel
        FBSnapshotVerifyView(movieListController.view)
    }

    func testWhenThereIsNoData() {
        let storyboard = UIStoryboard(storyboard: .movies)
        let movieListController: MovieListViewController = storyboard.instantiateViewController()
        let cellViewModel = getMovieListCellViewModel(count: 0)
        let viewModel = MockMovieListViewModel(movieListCellViewModel: cellViewModel)
        viewModel.delegate = movieListController
        movieListController.viewModel = viewModel
        FBSnapshotVerifyView(movieListController.view)
    }

}

extension MovieListsSnapshotTests {
    private func getMovieListCellViewModel(count: Int) -> [MovieListCellViewModel] {
        let viewModel = MovieListCellViewModel(movieImageUrl: URL(string: Constants.API.imageBaseURL)!, title: "Sherlock", placeHolderImage: "placeholder")
        return Array(repeating: viewModel, count: count)
    }
}
