//
//  ViewController.swift
//  view.Controller.practis#23
//
//  Created by Виктор on 16.09.2026.
//

import UIKit
import SnapKit

struct Movie {
       let name: String
       let rating: Double
       let imageName: String
}

class ViewController: UIViewController {
    let movies = [
        Movie(
            name: "Interstellar",
            rating: 8.7,
            imageName: "interstellar"
        ),

        Movie(
            name: "Gladiator",
            rating: 8.5,
            imageName: "gladiator"
        ),

        Movie(
            name: "Fight Club",
            rating: 8.8,
            imageName: "fightClub"
        ),

        Movie(
            name: "Pulp Fiction",
            rating: 8.9,
            imageName: "pulpFiction"
        )
    ]
    
    private let collectionView: UICollectionView = {

        let layout = UICollectionViewFlowLayout()

        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 16
        
        layout.sectionInset = UIEdgeInsets(
            top: 16,
            left: 16,
            bottom: 16,
            right: 16
        )

        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )

        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(collectionView)

        collectionView.register(
            MovieCell.self,
            forCellWithReuseIdentifier: "MovieCell"
        )

        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MovieCell",
            for: indexPath
        ) as? MovieCell else {
            return UICollectionViewCell()
        }
        let movie = movies[indexPath.item]
        cell.configure(with: movie)
        return cell
    }
    

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        let horizontalInset: CGFloat = 16
        let spacing: CGFloat = 10

        let availableWidth = collectionView.bounds.width
            - horizontalInset * 2
            - spacing

        let cellWidth = availableWidth / 2

        return CGSize(
            width: cellWidth,
            height: 220
        )
    }
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let selectedMovie = movies[indexPath.item]
        let detailsViewController = MovieDetailsViewController(
            movie: selectedMovie
        )
        navigationController?.pushViewController(
            detailsViewController,
            animated: true
        )
            print(selectedMovie.name)
    }
}
