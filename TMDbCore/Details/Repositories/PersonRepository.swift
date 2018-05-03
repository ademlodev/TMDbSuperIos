//
//  PersonRepository.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 05/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

final class PersonRepository {
	private let webService: WebService

	init(webService: WebService) {
		self.webService = webService
	}

	func person(withIdentifier identifier: Int64) -> Observable<PersonDetail> {
		return webService.load(PersonDetail.self, from: .person(identifier: identifier))
	}
}
