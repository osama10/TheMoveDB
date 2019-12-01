//
//  MockMovieListVIewModelDelegate.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import Foundation
@testable import TheMovieDB

final class MockMovieListVIewModelDelegate: MoviesListViewModelDelegate {

    var loaderAnimating = false
    var reloadDataCalled = false
    var alert = false

    func animateLoader() {
        loaderAnimating = true
    }

    func stopLoader() {
        loaderAnimating = false
    }

    func reloadData() {
        reloadDataCalled = true
    }

    func alert(with title: String, message: String) {
        alert = true
    }


}
