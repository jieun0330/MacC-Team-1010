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
	func getRecentComment() async throws -> RecentCommentsResponse
	func getNewMakList() async throws -> NewMakListResponse
}

public final class DefaultHomeRepository: HomeRepository {
	public init() { }
	
	public func getRecentComment() async throws -> RecentCommentsResponse {
		let response = try await HomeAPI.request(target: HomeAPI.recentComments, dataType: RecentCommentsResponse.self
		)
		return response
	}
	
	public func getNewMakList() async throws -> NewMakListResponse {
		let response = try await HomeAPI.request(target: HomeAPI.newMakList, dataType: NewMakListResponse.self
		)
		return response
	}
}
