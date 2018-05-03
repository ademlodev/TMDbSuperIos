//
//  KeyedDecodingContainer+Array.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 13/04/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

protocol DefaultConstructible {
	init()
}

extension Array: DefaultConstructible {}

extension KeyedDecodingContainer {
	func decode<T>(_ type: T.Type, forKey key: Key) throws -> T where T: Decodable & DefaultConstructible {
		if let value = try decodeIfPresent(T.self, forKey: key) {
			return value
		} else {
			return T()
		}
	}
}
