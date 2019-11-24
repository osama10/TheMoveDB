//
//  MovieRequest.swift
//  TheMovieDB
//
//  Created by Osama Bashir on 11/24/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import Foundation

struct MovieRequestModel: Encodable {
    let page: Int
    let api_key: String
}
