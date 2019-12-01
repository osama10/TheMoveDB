//
//  UIViewController+Extension.swift
//  TheMovieDB
//
//  Created by Osama Bashir on 11/30/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import UIKit

extension UIViewController {
    var topbarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
