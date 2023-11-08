//
//  SearchRepository.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/07.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import Utils

public protocol SearchRepository {
	func fetchSearch(keyword: String?) async throws -> SearchResponse
}

public final class DefaultSearchRepository: SearchRepository {
	public init() { }
	
	public func fetchSearch(keyword: String?) async throws -> SearchResponse {
		if let keyword {
			let response = try await SearchAPI.request(
				target: SearchAPI.fetchSearch(parameters: ["keyword": keyword]),
				dataType: SearchResponse.self
			)
			return response
		}
		let response = try await SearchAPI.request(
			target: SearchAPI.fetchSearch(parameters: .none),
			dataType: SearchResponse.self
		)
		return response
	}
}
