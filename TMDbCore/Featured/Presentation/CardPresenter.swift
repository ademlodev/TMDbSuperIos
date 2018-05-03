//
//  CardPresenter.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 27/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift
import RxCocoa

/// Presents movies or shows in card views
final class CardPresenter {
	private let imageRepository: ImageRepositoryProtocol

	init(imageRepository: ImageRepositoryProtocol) {
		self.imageRepository = imageRepository
	}

	func present(movie: Movie, in cardView: CardView) {
		bindBackdrop(at: movie.backdropPath, to: cardView)

		cardView.titleLabel.text = movie.title.uppercased()

		let genre = movie.genreIdentifiers.first.flatMap(Genre.name)
		let year = (movie.releaseDate?.year).flatMap { String($0) }

		cardView.metadataLabel.text = [year, genre]
			.compactMap { $0 }
			.joined(separator: " ⋅ ")
	}

	func present(show: Show, in cardView: CardView) {
		bindBackdrop(at: show.backdropPath, to: cardView)

		cardView.titleLabel.text = show.title.uppercased()

		let genre = show.genreIdentifiers.first.flatMap(Genre.name)
		let year = (show.firstAirDate?.year).flatMap { String($0) }

		cardView.metadataLabel.text = [year, genre]
			.compactMap { $0 }
			.joined(separator: " ⋅ ")
	}
}

private extension CardPresenter {
	func bindBackdrop(at path: String?, to cardView: CardView) {
		guard let path = path else {
			return
		}

		imageRepository.image(at: path, size: .w780)
			.observeOn(MainScheduler.instance)
			.bind(to: cardView.backdropView.rx.image)
			.disposed(by: cardView.disposeBag)
	}
}
