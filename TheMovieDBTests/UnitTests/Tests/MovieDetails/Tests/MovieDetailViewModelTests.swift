//
//  MovieDetailViewModelTests.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import XCTest
@testable import TheMovieDB

class MovieDetailViewModelTests: XCTestCase {
    var viewModel: MovieDetailViewModelProtocol!

    func test_whenViewDidLoadIsCalled_ThenFillUIMethodWillBeCalledOnDelgate() {
        let movie = Stubs.movieWithData
        let delegate = MockMovieDetailViewModelDelegate()
        viewModel = MovieDetailViewModel(movie: movie)
        viewModel.delegate = delegate
        viewModel.viewDidLoad()
        XCTAssertTrue(delegate.data.title == movie.title!)
        XCTAssertTrue(delegate.data.releaseData == "Release Date : \(movie.releaseDate!)")
        XCTAssertTrue(delegate.data.showAdultLabel == movie.adult!)
        XCTAssertTrue(delegate.data.overview == movie.overview!)
        XCTAssertTrue(delegate.data.rating == "Rating : \(movie.voteAverage!)/10")

    }

    func test_whenDataIsNil_fillUISentFallbackData() {
        let movie = MovieDTO(id: 1, title: nil, voteAverage: nil, posterPath: nil, originalTitle: nil, adult: nil, overview: nil, releaseDate: nil)
        let delegate = MockMovieDetailViewModelDelegate()
        viewModel = MovieDetailViewModel(movie: movie)
        viewModel.delegate = delegate
        viewModel.viewDidLoad()
        XCTAssertTrue(delegate.data.title == "Title not found")
        XCTAssertTrue(delegate.data.releaseData == "")
        XCTAssertTrue(delegate.data.showAdultLabel == false)
        XCTAssertTrue(delegate.data.overview == "")
        XCTAssertTrue(delegate.data.rating == "")

    }

}
