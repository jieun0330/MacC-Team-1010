//
//  TopicRepository.swift
//  Core
//
//  Created by Kim SungHun on 12/2/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation
import Utils

public protocol TopicRepository {
	func fetchPohangMakgeolli() async throws -> TopicResponse
	func fetchKoreaAward2023(size: Int) async throws -> TopicResponse
}

public final class DefaultTopicRepository: TopicRepository {
	public init() { }
	
	public func fetchPohangMakgeolli() async throws -> TopicResponse {
		let response = try await TopicAPI.request(target: TopicAPI.fetchPohangMakgeolli,
												  dataType: TopicResponse.self
		)
		return response
	}
	
	public func fetchKoreaAward2023(size: Int) async throws -> TopicResponse {
		var parameters: [String: Any] = [:]
		parameters["size"] = size
		
		let response = try await TopicAPI.request(target: TopicAPI.fetchKoreaAward2023(parameter: parameters),
												  dataType: TopicResponse.self
		)
		return response
	}
}
