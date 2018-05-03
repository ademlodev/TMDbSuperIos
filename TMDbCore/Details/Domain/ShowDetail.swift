//
//  ShowDetail.swift
//  TMDbCore
//
//  Created by Javi on 3/5/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

struct ShowDetail: Decodable {
    let identifier: Int64
    let name: String
    let posterPath: String?
    let backdropPath: String?
    let overview: String?
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case overview
    }
}
