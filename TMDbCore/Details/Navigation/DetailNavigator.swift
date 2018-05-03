//
//  DetailNavigator.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 07/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

protocol DetailNavigator {
	func navigateToShow(withIdentifier identifier: Int64)
	func navigateToMovie(withIdentifier identifier: Int64)
    func navigateToPerson(withIdentifier identifier: Int64)
}
