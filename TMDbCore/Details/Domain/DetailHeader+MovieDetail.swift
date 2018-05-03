//
//  DetailHeader+MovieDetail.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 08/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(movie: MovieDetail) {
        title = movie.title
        posterPath = movie.posterPath
        backdropPath = movie.backdropPath

        let year = (movie.releaseDate?.year).map { String($0) }
		let duration = "\(movie.runtime) min."

		metadata = [year, duration].compactMap { $0 }.joined(separator: " - ")
    }
    
    init(show: ShowDetail) {
        title = show.name
        posterPath = show.posterPath
        backdropPath = show.backdropPath
        
//        let year = (show.releaseDate?.year).map { String($0) }
//        let duration = "\(show.runtime) min."
//
//        metadata = [year, duration].compactMap { $0 }.joined(separator: " - ")
        metadata = ""
    }
}
