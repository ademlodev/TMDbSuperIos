//
//  PushDetailNavigator.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 07/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit

final class PushDetailNavigator: DetailNavigator {
    
	private let navigationController: UINavigationController
	private unowned let detailViewControllerProvider: DetailViewControllerProvider

	init(navigationController: UINavigationController,
	     detailViewControllerProvider: DetailViewControllerProvider) {
		self.navigationController = navigationController
		self.detailViewControllerProvider = detailViewControllerProvider
	}

	func navigateToShow(withIdentifier identifier: Int64) {
		let detailViewController = detailViewControllerProvider.showViewController(withIdentifier: identifier)
		navigationController.pushViewController(detailViewController, animated: true)
	}

	func navigateToMovie(withIdentifier identifier: Int64) {
		let detailViewController = detailViewControllerProvider.movieViewController(withIdentifier: identifier)
		navigationController.pushViewController(detailViewController, animated: true)
	}
    
    func navigateToPerson(withIdentifier identifier: Int64) {
        let detailViewController = detailViewControllerProvider.personViewController(withIdentifier: identifier)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
