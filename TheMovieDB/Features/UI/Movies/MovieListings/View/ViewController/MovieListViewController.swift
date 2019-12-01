//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Osama Bashir on 11/24/19.
//  Copyright © 2019 Osama Bashir. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MovieListViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: MoviesListViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setCollectionView()
        viewModel.viewDidLoad()
    }

    private func setupView() {
        self.view.backgroundColor = .black
        self.title = viewModel.title
    }

    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
    }
}

extension MovieListViewController: MoviesListViewModelDelegate {

    // MARK:- MoviesListViewModelDelegate
    func animateLoader() {
        self.startAnimating()
    }

    func stopLoader() {
        self.stopAnimating()
    }

    func reloadData() {
        collectionView.reloadData()
    }

    func alert(with title: String, message: String) {
        showAlert(with: title, and: message)
    }
}

extension MovieListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieListCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.viewModel = viewModel.getMovieListCellViewModel(for: indexPath.row)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.isLast = indexPath.row == (viewModel.numberOfRows - 1)

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didTapOnCell(index: indexPath.row)
    }
}

extension MovieListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.sizeForItem(numberOfCellsInRow: 2,
                                          collectionViewLayout: collectionViewLayout
        )
    }
}


