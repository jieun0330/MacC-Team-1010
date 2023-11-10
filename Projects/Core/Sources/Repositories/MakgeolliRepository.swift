//
//  MakgeolliRepository.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import Utils

public protocol MakgeolliRepository {
	func fetchFindByFeatures(sort: String?, offset: Int?,
							 category: [String]?) async throws -> FindByFeaturesResponse
	func fetchDetail(makNumber: Int, userId: Int) async throws -> MakHoly
	func fetchMakLikesAndComments(
		makNumber: Int) async throws -> (LikeDetail, [VisibleComment])
}

public final class DefaultMakgeolliRepository: MakgeolliRepository {
	public init() { }
	
	/// 서버에서 막걸리 정보 가져오기
	public func fetchDetail(makNumber: Int, userId: Int) async throws -> MakHoly {
		let request: [String: Any] = try DetailRequest(makNumber: makNumber, userId: userId).asDictionary()
		
		let response = try await MakgeolliAPI.request(
			target: MakgeolliAPI.fetchDetail(parameter: request),
			dataType: DetailResponse.self
		)
		
		if let result = response.result {
			return result.toEntity
		}
		return MakHoly()
	}
	
	public func fetchMakLikesAndComments(makNumber: Int) async throws -> (LikeDetail, [VisibleComment]) {
		let request: [String: Any] = try MakLikesAndCommentsRequest(
			makNumber: makNumber
		).asDictionary()
		let response = try await MakgeolliAPI.request(target: MakgeolliAPI.fetchMakLikesAndComments(
			parameter: request), dataType: MakLikesAndCommentsResponse.self
		)
		
		if let result = response.result {
			return result.toEntity()
		}
		
		return (LikeDetail(), [])
	}
	
	public func fetchFindByFeatures(sort: String?,
									offset: Int?,
									category: [String]?) async throws -> FindByFeaturesResponse {
		var parameters: [String: Any] = [:]
		var tempParameters: [[String: Any]] = []
		
		if let sort {
			tempParameters.append(["sort": sort])
		}
		
		if let category {
			let categoriesString = category.joined(separator: ",")
			tempParameters.append(["category": categoriesString])
		}
		
		if let offset {
			tempParameters.append(["offset": offset])
		}
		
		for item in tempParameters {
			for (key, value) in item {
				parameters[key] = value
			}
		}
		
		let response = try await MakgeolliAPI.request(target: MakgeolliAPI.fetchFindByFeatures(
			parameter: parameters), dataType: FindByFeaturesResponse.self
		)
		return response
	}
}
