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
	func fetchDetail(makNumber: Int) async throws -> MakHoly
//	func fetchMakList(lastMakNum: Int?,
//					  categories: [String]?,
//					  sort: String?) async throws -> MakListResponse
	func fetchMakLikesAndComments(
		makNumber: Int) async throws -> MakLikesAndCommentsResponse
	func fetchFindByFeatures(
		_ request: FindByFeaturesRequest
	) async throws -> FindByFeaturesResponse
}

public final class DefaultMakgeolliRepository: MakgeolliRepository {
	public init() { }
	
	/// 막걸리 리스트 가져오기
//	public func fetchMakList(lastMakNum: Int? = nil,
//							 categories: [String]? = nil,
//							 sort: String? = nil) async throws -> MakListResponse {
//		var parameters: [String: Any] = [:]
//		var tempParameters: [[String: Any]] = []
//
//		if let lastMakNum {
//			tempParameters.append(["lastMakNum": lastMakNum])
//		}
//
//		if let categories {
//			let categoriesString = categories.joined(separator: ",")
//			tempParameters.append(["category": categoriesString])
//		}
//
//		if let sort {
//			tempParameters.append(["sort": sort])
//		}
//
//		for item in tempParameters {
//			for (key, value) in item {
//				parameters[key] = value
//			}
//		}
//
//		let response = try await MakgeolliAPI.request(
//			target: MakgeolliAPI.fetchMakList(parameters: parameters),
//			dataType: MakListResponse.self
//		)
//		return response
//	}
	
	/// 서버에서 막걸리 정보 가져오기
	public func fetchDetail(makNumber: Int) async throws -> MakHoly {
		let request: [String: Any] = try DetailRequest(makNumber: makNumber).asDictionary()
		let response = try await MakgeolliAPI.request(target: MakgeolliAPI.fetchDetail(
			parameter: request), dataType: DetailResponse.self
		)
		if let result = response.result {
			return result.toEntity
		}
		
		// 에릭이 MakHoly emptyView init 만들면 그걸로 수정하기
		return MakHoly()
	}
	
	public func fetchMakLikesAndComments(makNumber: Int) async throws -> MakLikesAndCommentsResponse {
		let request: [String: Any] = try MakLikesAndCommentsRequest(
			makNumber: makNumber
		).asDictionary()
		let response = try await MakgeolliAPI.request(target: MakgeolliAPI.fetchMakLikesAndComments(
			parameter: request), dataType: MakLikesAndCommentsResponse.self
		)
		return response
	}
	
	public func fetchFindByFeatures(
		_ request: FindByFeaturesRequest
	) async throws -> FindByFeaturesResponse {
		let request: [String: Any] = try request.asDictionary()
		let response = try await MakgeolliAPI.request(target: MakgeolliAPI.fetchFindByFeatures(
			parameter: request), dataType: FindByFeaturesResponse.self
		)
		return response
	}
}
