//
//  DetailAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 30/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

final class DetailAssembly {
	private let imageLoadingAssembly: ImageLoadingAssembly
	private let navigationController: UINavigationController
	private let webServiceAssembly: WebServiceAssembly

	private(set) lazy var pushDetailNavigator = PushDetailNavigator(navigationController: navigationController,
																	detailViewControllerProvider: self)

	init(imageLoadingAssembly: ImageLoadingAssembly,
	     navigationController: UINavigationController,
	     webServiceAssembly: WebServiceAssembly) {
		self.imageLoadingAssembly = imageLoadingAssembly
		self.navigationController = navigationController
		self.webServiceAssembly = webServiceAssembly
	}

	func detailHeaderPresenter() -> DetailHeaderPresenter {
		return DetailHeaderPresenter(imageRepository: imageLoadingAssembly.imageRepository)
	}

	func posterStripPresenter() -> PosterStripPresenter {
		return PosterStripPresenter(imageRepository: imageLoadingAssembly.imageRepository)
	}

	func moviePresenter(identifier: Int64) -> DetailPresenter {
        return MoviePresenter(repository: movieRepository(),detailNavigator: pushDetailNavigator, identifier: identifier)
	}
    
    func showPresenter(identifier: Int64) -> DetailPresenter {
        return ShowPresenter(repository: showRepository(), identifier: identifier)
    }

	func personPresenter(identifier: Int64) -> DetailPresenter {
		return PersonPresenter(repository: personRepository(), identifier: identifier)
	}

	func movieRepository() -> MovieRepositoryProtocol {
		return MovieRepository(webService: webServiceAssembly.webService)
	}
    
    func showRepository() -> ShowRepositoryProtocol {
        return ShowRepository(webService: webServiceAssembly.webService)
    }

	func personRepository() -> PersonRepository {
		return PersonRepository(webService: webServiceAssembly.webService)
	}
    
}

extension DetailAssembly: DetailViewControllerProvider {
	// FIXME: Temporary!!
//    private class DummyDetailPresenter: DetailPresenter {
//        var view: DetailView?
//
//        func didLoad() {}
//        func didSelect(item: PosterStripItem) {}
//    }

	func movieViewController(withIdentifier identifier: Int64) -> UIViewController {
		return DetailViewController(presenter: moviePresenter(identifier: identifier),
									headerPresenter: detailHeaderPresenter(),
									posterStripPresenter: posterStripPresenter())
	}

	func showViewController(withIdentifier identifier: Int64) -> UIViewController {
		return DetailViewController(presenter: showPresenter(identifier: identifier),
									headerPresenter: detailHeaderPresenter(),
									posterStripPresenter: posterStripPresenter())
	}

	func personViewController(withIdentifier identifier: Int64) -> UIViewController {
		return DetailViewController(presenter: personPresenter(identifier: identifier),
									headerPresenter: detailHeaderPresenter(),
									posterStripPresenter: posterStripPresenter())
	}
}
