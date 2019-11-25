//
//  MovieRemoteDataStore.swift
//  TheMovieDB
//
//  Created by Osama Bashir on 11/25/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import Foundation
import OBNetworking

protocol MovieRemoteDataStoreDelegate {
    func didFetchMovie(movies : MovieResponseModel)
    func didFailWithError(error: Error)
}

protocol MovieRemoteDataStoreProtocol {
    var delegate: MovieRemoteDataStoreDelegate? { get set }
    func getMovies(parameters: MovieRequestModel)
}

final class MovieRemoteDataStore: MovieRemoteDataStoreProtocol {

    var delegate: MovieRemoteDataStoreDelegate?
    private let networkManager: Networking
    private let endpoint = "movie/now_playing"

    init(networkManager: Networking, delegate: MovieRemoteDataStoreDelegate? = nil) {
        self.delegate = delegate
        self.networkManager = networkManager
    }

    func getMovies(parameters: MovieRequestModel) {
        let path = APIPathBuilder(baseURL: Constants.API.baseURL, endPoint: endpoint)
        let request = RequestBuilder(path: path, parameters: parameters)

        networkManager.get(request: request) { [weak self] (response: APIResponse<MovieResponseModel>)  in
            guard let self = self else { return }

            switch response.result {
            case .success(let data):
                self.delegate?.didFetchMovie(movies: data)
            case .failure(let error):
                self.delegate?.didFailWithError(error: error)
            }
        }
    }

}
