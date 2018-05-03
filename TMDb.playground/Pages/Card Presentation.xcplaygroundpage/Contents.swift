@testable import TMDbCore
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let assembly = CoreAssembly(navigationController: UINavigationController())
let cardPresenter = assembly.featuredAssembly.cardPresenter()

let view = CardView.instantiate()
view.frame = CGRect(x: 0, y: 0, width: 375, height: 176)

let movie = Movie(identifier: 330459,
				  title: "Rogue One: A Star Wars Story",
				  posterPath: "/qjiskwlV1qQzRCjpV0cL9pEMF9a.jpg",
				  backdropPath: "/tZjVVIYXACV4IIIhXeIM59ytqwS.jpg",
				  releaseDate: Date(timeIntervalSince1970: 1474905532),
				  genreIdentifiers: [28, 12, 878])

cardPresenter.present(movie: movie, in: view)
PlaygroundPage.current.liveView = view
