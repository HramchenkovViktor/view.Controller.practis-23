//
//  MovieCell.swift
//  view.Controller.practis#23
//
//  Created by Виктор on 16.09.2026.
//

import UIKit
import SnapKit

class MovieCell: UICollectionViewCell {

    let nameLabel = UILabel()
    let ratingLabel = UILabel()
    let movieImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(nameLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(movieImageView)
        
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.clipsToBounds = true

        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)

        ratingLabel.font = .systemFont(ofSize: 14)
        ratingLabel.textColor = .secondaryLabel

        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        contentView.backgroundColor = .secondarySystemBackground
        
        
    }
    
    func setupConstraints() {

        movieImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(160)
        }

        nameLabel.snp.makeConstraints {
            $0.top.equalTo(movieImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(8)
        }

        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.bottom.lessThanOrEqualToSuperview().inset(8)
        }
    }
    func configure (with movie: Movie) {
        nameLabel.text = movie.name
        ratingLabel.text = "🌟\(movie.rating)"
        movieImageView.image = UIImage(named: movie.imageName)
    }

    }
    

