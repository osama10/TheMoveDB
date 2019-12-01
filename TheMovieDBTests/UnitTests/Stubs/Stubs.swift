//
//  Stubs.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import Foundation
@testable import TheMovieDB

final class Stubs {
    static let movieWithData = MovieDTO(id: 1, title: "Sherlock", voteAverage: 10, posterPath: "", originalTitle: "Sherlock", adult: false, overview: "Detective", releaseDate: "11-11-2019")

    static let movieWithNoData = MovieDTO(id: 1, title: nil, voteAverage: nil, posterPath: nil, originalTitle: nil, adult: nil, overview: nil, releaseDate: nil)

    static let responseModelWithPagination = MovieResponseModel(page: 1, totalResults: 2, totalPages: 2, movies: [Stubs.movieWithNoData])
    static let responseModelWithoutPagination = MovieResponseModel(page: 1, totalResults: 1, totalPages: 1, movies: [Stubs.movieWithNoData])

    static let movieRequest = MovieRequestModel(page: 1, api_key: "")
}
