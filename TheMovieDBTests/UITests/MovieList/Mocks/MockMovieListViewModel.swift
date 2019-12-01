//
//  MockMovieListViewModel.swift
//  TheMovieDBTests
//
//  Created by Osama Bashir on 12/1/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import Foundation
@testable import TheMovieDB

final class MockMovieListViewModel: MoviesListViewModelProtocol {
    var delegate: MoviesListViewModelDelegate?
    var numberOfRows: Int {
        return movieListCellViewModel.count
    }
    var sections: Int = 1
    var title: String = "TheMovieDB"
    var isLast: Bool = false
    private let movieListCellViewModel: [MovieListCellViewModel]

    init(movieListCellViewModel: [MovieListCellViewModel]) {
        self.movieListCellViewModel = movieListCellViewModel
    }

    func viewDidLoad() {
        delegate?.reloadData()
    }

    func didTapOnCell(index: Int) {

    }

    func getMovieListCellViewModel(for index: Int) -> MovieListCellViewModel {
        return movieListCellViewModel[index]
    }


}
