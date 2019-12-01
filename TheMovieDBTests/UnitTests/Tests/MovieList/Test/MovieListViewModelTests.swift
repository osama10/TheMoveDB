//
//  MovieListViewModel.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import XCTest
@testable import TheMovieDB

class MovieListViewModelTests: XCTestCase {

    var viewModel: MoviesListViewModelProtocol!

    func test_ViewModelWhenMoviesFetchedSuccessfully() {
        let mockService = MockMovieServices(testCase: .didFetchMovies)
        viewModel = MoviesListViewModel(moviesService: mockService, navigator: MockMovieListNavigator())
        mockService.delegate = viewModel as? MoviesServiceDelegate
        let viewModelDelegate = MockMovieListVIewModelDelegate()
        viewModel.delegate = viewModelDelegate
        viewModel.viewDidLoad()
        XCTAssertTrue(viewModel.numberOfRows == 2)
        XCTAssertFalse(viewModelDelegate.loaderAnimating)
        XCTAssertTrue(viewModelDelegate.reloadDataCalled)
    }

    func test_ViewModelWhenMoviesFailedWithError() {
        let mockService = MockMovieServices(testCase: .didFailWithError)
        viewModel = MoviesListViewModel(moviesService: mockService, navigator: MockMovieListNavigator())
        mockService.delegate = viewModel as? MoviesServiceDelegate
        let viewModelDelegate = MockMovieListVIewModelDelegate()
        viewModel.delegate = viewModelDelegate
        viewModel.viewDidLoad()
        XCTAssertTrue(viewModel.numberOfRows == 1)
        XCTAssertFalse(viewModelDelegate.loaderAnimating)
        XCTAssertTrue(viewModelDelegate.reloadDataCalled)
    }

    func test_ViewModelWhenCantFetchMovie() {
        let mockService = MockMovieServices(testCase: .cantFetchMovie)
        viewModel = MoviesListViewModel(moviesService: mockService, navigator: MockMovieListNavigator())
        mockService.delegate = viewModel as? MoviesServiceDelegate
        let viewModelDelegate = MockMovieListVIewModelDelegate()
        viewModel.delegate = viewModelDelegate
        viewModel.viewDidLoad()
        XCTAssertTrue(viewModel.numberOfRows == 0)
        XCTAssertFalse(viewModelDelegate.loaderAnimating)
    }

    func test_ViewModelWhenMoviesFailedWithNoLocalData() {
        let mockService = MockMovieServices(testCase: .didFaileErrorWithNoLocalData)
        viewModel = MoviesListViewModel(moviesService: mockService, navigator: MockMovieListNavigator())
        mockService.delegate = viewModel as? MoviesServiceDelegate
        let viewModelDelegate = MockMovieListVIewModelDelegate()
        viewModel.delegate = viewModelDelegate
        viewModel.viewDidLoad()
        XCTAssertTrue(viewModel.numberOfRows == 0)
        XCTAssertFalse(viewModelDelegate.loaderAnimating)
        XCTAssertTrue(viewModelDelegate.alert)
    }

    func test_WhenGetMovieListCellViewModelIsCalled_ItReturnsCorrectData() {
        let mockService = MockMovieServices(testCase: .didFetchMovies)
        viewModel = MoviesListViewModel(moviesService: mockService, navigator: MockMovieListNavigator())
        mockService.delegate = viewModel as? MoviesServiceDelegate
        let viewModelDelegate = MockMovieListVIewModelDelegate()
        viewModel.delegate = viewModelDelegate
        viewModel.viewDidLoad()
        XCTAssertTrue(viewModel.numberOfRows == 2)
        XCTAssertTrue(viewModel.getMovieListCellViewModel(for: 0).placeHolderImage == "placeholder")
         XCTAssertTrue(viewModel.getMovieListCellViewModel(for: 0).title == "Sherlock")
        XCTAssertTrue(viewModel.getMovieListCellViewModel(for: 0).movieImageUrl == URL(string: Constants.API.imageBaseURL)!)

    }

    func test_WhenDidTapCellCall_NavigatorGetsRightData() {
        let mockService = MockMovieServices(testCase: .didFetchMovies)
        let navigator = MockMovieListNavigator()
        viewModel = MoviesListViewModel(moviesService: mockService, navigator: navigator)
        mockService.delegate = viewModel as? MoviesServiceDelegate
        let viewModelDelegate = MockMovieListVIewModelDelegate()
        viewModel.delegate = viewModelDelegate
        viewModel.viewDidLoad()
        viewModel.didTapOnCell(index: 0)
        XCTAssertTrue(viewModel.numberOfRows == 2)
        XCTAssertTrue(viewModel.getMovieListCellViewModel(for: 0).placeHolderImage == "placeholder")
        XCTAssertTrue(navigator.movie.title == Stubs.movieWithData.title)
        XCTAssertTrue(navigator.movie.id == Stubs.movieWithData.id)
        XCTAssertTrue(navigator.movie.overview == Stubs.movieWithData.overview)

    }
}

