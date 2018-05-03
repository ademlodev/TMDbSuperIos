@testable import TMDbCore

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()
let assembly = CoreAssembly(navigationController: UINavigationController())
let imageRepository = assembly.imageLoadingAssembly.imageRepository
let webService = WebService(configuration: .default)

enum TestError: Error {
	case imageNotFound
}

// Load the backdrop of the first show on the air
webService.load(Page<Show>.self, from: .showsOnTheAir(page: 1))
	.flatMap { page -> Observable<UIImage> in
		guard let backdropPath = page.results.first?.backdropPath else {
			throw TestError.imageNotFound
		}

		return imageRepository.image(at: backdropPath, size: .original)
	}
	.subscribe { event in
		switch event {
		case .next(let image):
			let stupidXcode = image
			print(stupidXcode)
		case .error(let error):
			print(error)
		case .completed:
			print("completed")
		}
	}


