//
//  MockMovieDetailDelegate.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import Foundation
@testable import TheMovieDB


final class MockMovieDetailViewModelDelegate: MovieDetailViewModelDelegate {

    var data: MovieDetailData!

    func fillUI(with data: MovieDetailData) {
        self.data = data
    }
}
