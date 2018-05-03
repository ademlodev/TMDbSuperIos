//
//  SearchNavigator.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 07/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit

final class SearchNavigator {
	private unowned let searchResultsViewControllerProvider: SearchResultsViewControllerProvider
	private var searchController: UISearchController!

	init(searchResultsViewControllerProvider: SearchResultsViewControllerProvider) {
		self.searchResultsViewControllerProvider = searchResultsViewControllerProvider
	}

	func installSearch(in viewController: UIViewController) {
		let searchResultsViewController = searchResultsViewControllerProvider.searchResultsViewController()
		searchController = UISearchController(searchResultsController: searchResultsViewController)

		searchController.searchResultsUpdater = searchResultsViewController
		searchController.hidesNavigationBarDuringPresentation = false
		searchController.searchBar.placeholder = NSLocalizedString("Search movies, shows and people", comment: "")
		searchController.searchBar.searchBarStyle = .minimal

		viewController.navigationItem.titleView = searchController.searchBar
		viewController.definesPresentationContext = true
	}
}
