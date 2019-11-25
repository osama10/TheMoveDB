//
//  Predicate.swift
//  TheMovieDB
//
//  Created by Osama Bashir on 11/25/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import Foundation

struct Predicate{
    var format : String
    var arguments : [Any]
    init(format : String , arguments : [Any]) {
        self.format = format
        self.arguments = arguments
    }
}
