//
//  MovieDetailsViewController.swift
//  view.Controller.practis#23
//
//  Created by Виктор on 16.09.2026.
//

import UIKit
import SnapKit

class MovieDetailsViewController: UIViewController {

    let movie: Movie

    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.title = movie.name
    }
}
