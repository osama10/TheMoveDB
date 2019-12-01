//
//  MovieListsSnapshotTests.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import FBSnapshotTestCase
@testable import TheMovieDB

class MovieListsSnapshotTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        recordMode = true
    }


    func testExample() {
        let storyboard = UIStoryboard(storyboard: .movies)
        let movieDetailController: MovieListViewController = storyboard.instantiateViewController()
        
    }


}

extension MovieListsSnapshotTests {
    private func getMovieListCellViewModel() -> [MovieListCell]
}
