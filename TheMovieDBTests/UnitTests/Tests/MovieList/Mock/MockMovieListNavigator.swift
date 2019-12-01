//
//  MockMovieListNavigator.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import Foundation
@testable import TheMovieDB

final class MockMovieListNavigator: MoviesListNavigatorProtocol {

    var movie: MovieDTO!
    func navigateToDetail(with movie: MovieDTO) {
        self.movie = movie
    }


}
