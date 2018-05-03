@testable import TMDbCore

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let assembly = CoreAssembly(navigationController: UINavigationController())
let presenter = assembly.searchAssembly.resultPresenter()

let cell = SearchResultCell.instantiate()
cell.backgroundColor = .white

let movie = Movie(identifier: 330459,
				  title: "Rogue One: A Star Wars Story",
				  posterPath: "/qjiskwlV1qQzRCjpV0cL9pEMF9a.jpg",
				  backdropPath: "/tZjVVIYXACV4IIIhXeIM59ytqwS.jpg",
				  releaseDate: Date(timeIntervalSince1970: 1474905532),
				  genreIdentifiers: [28, 12, 878])

presenter.present(searchResult: .movie(movie), in: cell)
PlaygroundPage.current.liveView = cell
