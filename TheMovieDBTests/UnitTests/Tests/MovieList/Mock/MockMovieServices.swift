//
//  MockMovieServices.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import Foundation
@testable import TheMovieDB

final class MockMovieServices: MoviesServiceProtocol {

    enum DelegateCases {
        case didFetchMovies
        case didFailWithError
        case didFaileErrorWithNoLocalData
        case cantFetchMovie
    }

    var delegate: MoviesServiceDelegate?
    private let testCase: DelegateCases

    init(testCase: DelegateCases) {
        self.testCase = testCase
    }

    func getMovies() {
        switch testCase {
        case .didFetchMovies:
            delegate?.didFetchMovies(movies: [Stubs.movieWithData,Stubs.movieWithNoData])
        case .didFailWithError:
            delegate?.didFailWithError(movies: [Stubs.movieWithNoData], error: MockError())
        case .didFaileErrorWithNoLocalData:
            delegate?.didFailWithError(movies: [], error: MockError())
        case .cantFetchMovie:
            delegate?.cantFetchMovie()
        }
    }

}

