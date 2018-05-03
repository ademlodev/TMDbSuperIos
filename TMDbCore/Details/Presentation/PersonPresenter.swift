//
//  PersonPresenter.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 05/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

final class PersonPresenter: DetailPresenter {
	private let repository: PersonRepository
	private let identifier: Int64
	private let disposeBag = DisposeBag()

	weak var view: DetailView?

	init(repository: PersonRepository, identifier: Int64) {
		self.repository = repository
		self.identifier = identifier
	}

	func didLoad() {
		view?.setLoading(true)

		repository.person(withIdentifier: identifier)
			.map { [weak self] person in
				self?.detailSections(for: person) ?? []
			}
			.observeOn(MainScheduler.instance)
			.subscribe(onNext: { [weak self] sections in
				self?.view?.update(with: sections)
				}, onDisposed: { [weak self] in
					self?.view?.setLoading(false)
			})
			.disposed(by: disposeBag)
	}

	func didSelect(item: PosterStripItem) {
		// Nothing to do here
	}
}

private extension PersonPresenter {
	func detailSections(for person: PersonDetail) -> [DetailSection] {
		var detailSections: [DetailSection] = [
			.header(DetailHeader(person: person))
		]

		if let biography = person.biography {
			detailSections.append(.about(title: "About", detail: biography))
		}

		return detailSections
	}
}
