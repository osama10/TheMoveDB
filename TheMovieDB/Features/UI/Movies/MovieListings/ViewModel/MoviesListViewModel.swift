//
//  MoviesListViewModel.swift
//  TheMovieDB
//
//  Created by Osama Bashir on 11/26/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import Foundation

protocol MoviesListViewModelDelegate: class {
    func animateLoader()
    func stopLoader()
    func reloadData()
}

protocol MoviesListViewModelProtocol {

    var delegate: MoviesListViewModelDelegate? { get set }
    var numberOfRows: Int { get }
    var sections: Int { get }
    var title: String { get }
    var isLast: Bool { get set }

    func viewDidLoad()
    func didTapOnCell(index: Int)
    func getMovieListCellViewModel(for index: Int) -> MovieListCellViewModel

}

final class MoviesListViewModel: MoviesListViewModelProtocol {

    weak var delegate: MoviesListViewModelDelegate?
    var numberOfRows: Int { return movies.count }
    var sections: Int { return 1 }
    var title: String { return "The MovieDB" }
    var isLast: Bool = false {
        didSet {
            if isLast {
                getMovies()
            }
        }
    }

    private var movies : [MovieDTO] = []
    private let moviesService: MoviesServiceProtocol
    private let navigator: MoviesListNavigatorProtocol
    private let numberOfSections = 1

    init(moviesService: MoviesServiceProtocol, navigator: MoviesListNavigatorProtocol, delegate: MoviesListViewModelDelegate? = nil) {
        self.moviesService = moviesService
        self.delegate = delegate
        self.navigator = navigator
    }

    func viewDidLoad() {
        getMovies()
    }

    func didTapOnCell(index: Int) {
        navigator.navigateToDetail(with: movies[index])
    }

    func getMovieListCellViewModel(for index: Int) -> MovieListCellViewModel {
        let title = movies[index].title ?? ""
        let baseImageUrl = Constants.API.imageBaseURL
        guard let posterPath = movies[index].posterPath
            else {
                return createMovieListCellViewModel(movieImageURL: baseImageUrl, title: title)
        }
        let movieImageURL = Constants.API.imageBaseURL + posterPath
        return createMovieListCellViewModel(movieImageURL: movieImageURL , title: title)
    }

    private func getMovies() {
        delegate?.animateLoader()
        moviesService.getMovies()
    }

    private func createMovieListCellViewModel(movieImageURL: String, title: String) -> MovieListCellViewModel {
        return MovieListCellViewModel(movieImageUrl: URL(string: movieImageURL)!, title: title, placeHolderImage: "placeholder")
    }
}

extension MoviesListViewModel: MoviesServiceDelegate {
    // MARK:- MoviesRepositoryDelegate
    func didFetchMovies(movies: [MovieDTO]) {
        self.movies += movies
        delegate?.reloadData()
        delegate?.stopLoader()
    }

    func cantFetchMovie() {
        delegate?.stopLoader()
    }
}
