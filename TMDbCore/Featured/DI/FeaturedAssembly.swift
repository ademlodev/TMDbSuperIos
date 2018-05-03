//
//  FeaturedAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 27/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

final public class FeaturedAssembly {
	private let imageLoadingAssembly: ImageLoadingAssembly
	private let detailAssembly: DetailAssembly
	private let searchAssembly: SearchAssembly
	private let webServiceAssembly: WebServiceAssembly

	init(imageLoadingAssembly: ImageLoadingAssembly,
	     detailAssembly: DetailAssembly,
	     searchAssembly: SearchAssembly,
	     webServiceAssembly: WebServiceAssembly) {
		self.imageLoadingAssembly = imageLoadingAssembly
		self.detailAssembly = detailAssembly
		self.searchAssembly = searchAssembly
		self.webServiceAssembly = webServiceAssembly
	}

	public func viewController() -> UIViewController {
		return FeaturedViewController(presenter: presenter(),
		                              cardPresenter: cardPresenter(),
		                              searchNavigator: searchAssembly.searchNavigator())
	}

	func presenter() -> FeaturedPresenter {
        return FeaturedPresenter(detailNavigator: detailAssembly.pushDetailNavigator,
                                 repository: featuredRepository())
	}

	func cardPresenter() -> CardPresenter {
		return CardPresenter(imageRepository: imageLoadingAssembly.imageRepository)
	}
    
    func featuredRepository() -> FeaturedRepositoryProtocol {
        return FeaturedRepository(webService: webServiceAssembly.webService)
    }
}
