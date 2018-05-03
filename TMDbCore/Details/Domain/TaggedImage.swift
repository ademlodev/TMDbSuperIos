//
//  TaggedImage.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 05/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct TaggedImage: Decodable {
	let path: String
	let aspectRatio: Double

	private enum CodingKeys: String, CodingKey {
		case path = "file_path"
		case aspectRatio = "aspect_ratio"
	}
}
