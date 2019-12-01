//
//  BaseViewController.swift
//  TheMovieDB
//
//  Created by Osama Bashir on 11/30/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController, NVActivityIndicatorViewable, AlertsPresentable {

    var noInternetHeaderView: NoInternetHeaderView!
    let reachability = Reachability()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNoInternetHeaderView()
        setReachability()
    }

    private func setNoInternetHeaderView() {
        noInternetHeaderView = NoInternetHeaderView.loadNib()
        noInternetHeaderView.frame = CGRect(x: 0, y: topbarHeight, width: UIScreen.main.bounds.width, height: 40)
        noInternetHeaderView.isHidden = true
        self.view.addSubview(noInternetHeaderView)
    }

    private func setReachability() {
        reachability?.whenReachable = { [weak self] _  in
            guard let self = self else { return }
            if !(self.noInternetHeaderView.isHidden) {
                self.noInternetHeaderView.isHidden.toggle()
            }
        }

        reachability?.whenUnreachable = { _ in
            if (self.noInternetHeaderView.isHidden) {
                self.noInternetHeaderView.isHidden.toggle()
            }
        }
        try? reachability?.startNotifier()
    }

}
