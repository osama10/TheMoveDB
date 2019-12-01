//
//  MockMovieRemoteDatastore.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import Foundation
@testable import TheMovieDB

final class MockMovieRemoteDatastore: MoviesRemoteDataStoreProtocol {
    enum DelegateCases {
        case didFetchMovies
        case didFailWithError
    }

    var delegate: MoviesRemoteDataStoreDelegate?
    var testCase: DelegateCases

    init(testCase: DelegateCases) {
        self.testCase = testCase
    }
    
    func getMovies(parameters: MovieRequestModel) {
        switch testCase {
        case .didFetchMovies:
            delegate?.didFetchMovie(movies: Stubs.responseModelWithPagination)
        case .didFailWithError:
            delegate?.didFailWithError(error: MockError())
        }
    }
}
