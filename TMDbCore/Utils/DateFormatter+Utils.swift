//
//  DateFormatter+Utils.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 23/12/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DateFormatter {
	static let tmdbDateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		formatter.timeZone = TimeZone(secondsFromGMT: 0)

		return formatter
	}()
}
