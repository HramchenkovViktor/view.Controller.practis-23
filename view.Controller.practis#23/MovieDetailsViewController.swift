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
    let movieImageView = UIImageView()
    let nameLabel = UILabel()
    let ratingLabel = UILabel()
    
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        configure()
    
        view.backgroundColor = .systemBackground
        navigationItem.title = movie.name
    }
    func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(movieImageView)
        view.addSubview(nameLabel)
        view.addSubview(ratingLabel)

        movieImageView.contentMode = .scaleAspectFill
        movieImageView.clipsToBounds = true
        movieImageView.layer.cornerRadius = 16

        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)

        ratingLabel.font = .systemFont(ofSize: 18)
        ratingLabel.textColor = .secondaryLabel
    }
    func setupConstraints() {
        movieImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(240)
            $0.height.equalTo(320)
        }

        nameLabel.snp.makeConstraints {
            $0.top.equalTo(movieImageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }

        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    func configure() {
        nameLabel.text = movie.name
        ratingLabel.text = "🌟 \(movie.rating)"
        movieImageView.image = UIImage(named: movie.imageName)
    }
}
