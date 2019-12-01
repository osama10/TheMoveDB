//
//  MoviesRepositoryTests.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import XCTest
@testable import TheMovieDB

class MoviesRepositoryTests: XCTestCase {

    var repository: MoviesRepositoryProtocol!

    func test_WhenGetMoviesCalledMoviesAndFetchedSuccessfully() {
        let delgate = MockMoviesRepositoryDelegate()
        let localDataStore = MockLocalMovieDatasource()
        let remoteDataStore = MockMovieRemoteDatastore(testCase: .didFetchMovies)
        repository = MoviesRepository(remoteMoviesDataSource:remoteDataStore , localMoviesDataSource: localDataStore, delegate: delgate)
        remoteDataStore.delegate = repository as? MoviesRemoteDataStoreDelegate
        repository.getMovies(parameters: Stubs.movieRequest)
        XCTAssertTrue(delgate.movies.count == 1)
        XCTAssertTrue(delgate.movies.first?.id == 1)
        XCTAssertTrue(localDataStore.movies.count == 1)
        XCTAssertTrue(localDataStore.movies.first?.id == 1)
    }

    func test_WhenGetMoviesCalledAndFailedWithError() {
        let delgate = MockMoviesRepositoryDelegate()
        let localDataStore = MockLocalMovieDatasource()
        let remoteDataStore = MockMovieRemoteDatastore(testCase: .didFailWithError)
        repository = MoviesRepository(remoteMoviesDataSource:remoteDataStore , localMoviesDataSource: localDataStore, delegate: delgate)
        remoteDataStore.delegate = repository as? MoviesRemoteDataStoreDelegate
        repository.getMovies(parameters: Stubs.movieRequest)
        XCTAssertTrue(delgate.movies.count == 2)
        XCTAssertTrue(delgate.movies.first?.id == 1)
        XCTAssertTrue(delgate.movies.first?.title == "Sherlock")
        XCTAssertTrue(localDataStore.movies.count == 2)
        XCTAssertTrue(localDataStore.movies.first?.id == 1)
        XCTAssertTrue(localDataStore.movies.first?.title == "Sherlock")
    }
}
