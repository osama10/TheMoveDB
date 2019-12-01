//
//  MovieServicesDelegate.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import Foundation
@testable import TheMovieDB

final class MockMovieServicesDelegate: MoviesServiceDelegate {

    
    var movies: [MovieDTO]!
    var cantFetchMoviesCalled = false

    func didFetchMovies(movies: [MovieDTO]) {
        self.movies = movies
    }

    func didFailWithError(movies: [MovieDTO], error: Error) {
        self.movies = movies
    }

    func cantFetchMovie() {
        cantFetchMoviesCalled = true
    }

}
