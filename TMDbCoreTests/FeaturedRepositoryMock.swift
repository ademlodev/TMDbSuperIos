//
//  FeaturedRepositoryMock.swift
//  TMDbCoreTests
//
//  Created by Guille Gonzalez on 16/04/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

@testable import TMDbCore
import RxSwift

// This is a mock and a stub at the same time.
// Notice we can stub the implementation of the methods using the
// xxxStub variables.
final class FeaturedRepositoryMock: FeaturedRepositoryProtocol {
	var moviesNowPlayingCalls: [String] = []
	var showsOnTheAirCalls: [Void] = []

	var moviesNowPlayingStub: (String) -> Observable<[Movie]> = { _ in
		return Observable.empty()
	}

	var showsOnTheAirStub: () -> Observable<[Show]> = {
		return Observable.empty()
	}

	func moviesNowPlaying(region: String) -> Observable<[Movie]> {
		moviesNowPlayingCalls.append(region)
		return moviesNowPlayingStub(region)
	}

	func showsOnTheAir() -> Observable<[Show]> {
		showsOnTheAirCalls.append(())
		return showsOnTheAirStub()
	}
}
