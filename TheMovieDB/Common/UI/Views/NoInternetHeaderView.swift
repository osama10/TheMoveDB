//
//  NoInternetHeaderView.swift
//  TheMovieDB
//
//  Created by Osama Bashir on 11/30/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import UIKit

class NoInternetHeaderView: UIView, NibLoadableView {

    @IBOutlet weak var noInternetLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    private func setup() {
        self.backgroundColor = .red
        noInternetLabel.font = UIFont(.avenirDemiBold, size: .standard(.h6))
        noInternetLabel.textColor = .white
        noInternetLabel.text = "No internet connection"
        noInternetLabel.textAlignment = .center
    }
}
