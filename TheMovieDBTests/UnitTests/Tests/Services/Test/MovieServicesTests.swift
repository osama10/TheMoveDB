//
//  MovieServicesTests.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import XCTest
@testable import TheMovieDB

class MovieServicesTests: XCTestCase {

    var movieServices: MoviesServiceProtocol!

    func test_WhenGetMoviesCalledWithFetchMoviesWithPagination() {
        let repo = MockMovieRepository(testCase: .didFetchMoviesWithPagination)
        movieServices = MoviesService(moviesRepository: repo)
        repo.delegate = movieServices as? MoviesRepositoryDelegate
        let delegate = MockMovieServicesDelegate()
        movieServices.delegate = delegate
        movieServices.getMovies()
        XCTAssertTrue(delegate.movies.count == 1)
        XCTAssertTrue(delegate.movies[0].id == Stubs.movieWithData.id)
        XCTAssertFalse(delegate.cantFetchMoviesCalled)
    }

    func test_WhenGetMoviesCalledWithFetchMoviesWithoutPagination() {
        let repo = MockMovieRepository(testCase: .didFetchMoviesWithoutPagination)
        movieServices = MoviesService(moviesRepository: repo)
        repo.delegate = movieServices as? MoviesRepositoryDelegate
        let delegate = MockMovieServicesDelegate()
        movieServices.delegate = delegate
        movieServices.getMovies()
        movieServices.getMovies()
        XCTAssertTrue(delegate.movies.count == 1)
        XCTAssertTrue(delegate.movies[0].id == Stubs.movieWithData.id)
        XCTAssertTrue(delegate.cantFetchMoviesCalled)
    }

    func test_WhenGetMoviesCalledFailedWithError() {
        let repo = MockMovieRepository(testCase: .didFailWithError)
        movieServices = MoviesService(moviesRepository: repo)
        repo.delegate = movieServices as? MoviesRepositoryDelegate
        let delegate = MockMovieServicesDelegate()
        movieServices.delegate = delegate
        movieServices.getMovies()
        XCTAssertTrue(delegate.movies.count == 1)
        XCTAssertNil(delegate.movies[0].title)
        XCTAssertFalse(delegate.cantFetchMoviesCalled)
    }
}
