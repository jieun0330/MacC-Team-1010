//
//  HomeRepository.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/07.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import Utils

public protocol HomeRepository {
	func fetchRecentComment() async throws -> RecentCommentsResponse
	func fetchNewMakList() async throws -> NewMakListResponse
}

public final class DefaultHomeRepository: HomeRepository {
	public init() { }
	
	public func fetchRecentComment() async throws -> RecentCommentsResponse {
		let response = try await HomeAPI.request(target: HomeAPI.fetchRecentComments,
												 dataType: RecentCommentsResponse.self
		)
		return response
	}
	
	public func fetchNewMakList() async throws -> NewMakListResponse {
		let response = try await HomeAPI.request(target: HomeAPI.fetchNewMakList,
												 dataType: NewMakListResponse.self
		)
		return response
	}
}
