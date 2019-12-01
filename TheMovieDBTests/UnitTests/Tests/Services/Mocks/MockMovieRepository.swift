//
//  MockMovieRepository.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import Foundation
@testable import TheMovieDB

final class MockMovieRepository: MoviesRepositoryProtocol {

    enum DelegateCases {
        case didFetchMoviesWithPagination
        case didFetchMoviesWithoutPagination
        case didFailWithError
    }

    var delegate: MoviesRepositoryDelegate?

    var testCase: DelegateCases

    init(testCase: DelegateCases) {
        self.testCase = testCase
    }

    func getMovies(parameters: MovieRequestModel) {
        switch testCase {
        case .didFetchMoviesWithPagination:
            delegate?.didFetchMovie(movies: Stubs.responseModelWithPagination)
        case .didFetchMoviesWithoutPagination:
            delegate?.didFetchMovie(movies: Stubs.responseModelWithoutPagination)
        case .didFailWithError:
            delegate?.didFailWithError(movies: [Stubs.movieWithNoData], error: MockError())
    }
}

}
