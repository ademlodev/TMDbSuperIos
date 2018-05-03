//
//  PersonDetail.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 05/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct PersonDetail: Decodable {
	let biography: String?
	let birthday: String?
	let deathday: String?
	let identifier: Int64
	let name: String
	let profilePath: String?
	let taggedImages: Page<TaggedImage>

	private enum CodingKeys: String, CodingKey {
		case biography
		case birthday
		case deathday
		case identifier = "id"
		case name
		case profilePath = "profile_path"
		case taggedImages = "tagged_images"
	}
}
