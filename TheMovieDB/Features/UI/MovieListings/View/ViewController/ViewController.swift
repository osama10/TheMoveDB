//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Osama Bashir on 11/24/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import UIKit
import OBNetworking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = APIPathBuilder(baseURL: "http://api.themoviedb.org/3/", endPoint: "movie/now_playing")
        let params = MovieRequestModel(page: 1, api_key: "2696829a81b1b5827d515ff121700838")
        let request = RequestBuilder(path: path, parameters: params)

//        networkManager.get(request: request) { (response: APIResponse<MovieResponseModel>) in
//            print(response)
//        }
    }


}

