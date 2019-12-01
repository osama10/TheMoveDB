//
//  MockLocalMovieDatasource.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import Foundation
@testable import TheMovieDB

final class MockLocalMovieDatasource: MoviesLocalDataSourceProtocol {

    var movies: [MovieDTO] = [Stubs.movieWithData, Stubs.movieWithNoData]

    func getMovies(id: String?) -> [MovieDTO] {
        return movies
    }

    func saveMovies(movies: [MovieDTO]) {
        self.movies +=  movies
    }

    func deleteMovies(movies: [MovieDTO]) {
        self.movies.removeFirst()
    }

    func deleteAllMovies() {
        self.movies.removeAll()
    }

    func updateMovies(movies: [MovieDTO]) {
        self.movies +=  movies
    }


}
