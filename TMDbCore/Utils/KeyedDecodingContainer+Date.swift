//
//  KeyedDecodingContainer+Date.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 13/04/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {
	func decodeIfPresent(_ type: Date.Type, forKey key: Key) throws -> Date? {
		// We need some flexibility than the date decoding strategy does not provide:
		// Treat empty or invalid strings as null values.
		if let value = try decodeIfPresent(String.self, forKey: key) {
			return DateFormatter.tmdbDateFormatter.date(from: value)
		} else {
			return nil
		}
	}
}
