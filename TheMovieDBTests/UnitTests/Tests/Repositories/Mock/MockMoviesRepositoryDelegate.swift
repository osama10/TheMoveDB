//
//  MockMoviesRepositoryDelegate.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import Foundation
@testable import TheMovieDB

final class MockMoviesRepositoryDelegate: MoviesRepositoryDelegate {

    var movies: [MovieDTO]!

    func didFetchMovie(movies: MovieResponseModel) {
        self.movies = movies.movies
    }

    func didFailWithError(movies: [MovieDTO], error: Error) {
        self.movies = movies
    }


}
