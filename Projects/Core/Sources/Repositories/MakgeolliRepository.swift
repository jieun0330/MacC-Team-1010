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
	func fetchMakgeolliInfo(makNumber: Int) async throws -> MakHoly
	func fetchMakgeolliList(lastMakNum: Int?,
							categories: [String]?,
							sort: String?) async throws -> MakgeolliListResponse
	func fetchMakgeolliLikesAndComments(
		makNumber: Int) async throws -> MakgeolliLikesAndCommentResponse
}

public final class DefaultMakgeolliRepository: MakgeolliRepository {
	public init() { }
	
	/// 막걸리 리스트 가져오기
	public func fetchMakgeolliList(lastMakNum: Int? = nil,
								   categories: [String]? = nil,
								   sort: String? = nil) async throws -> MakgeolliListResponse {
		var parameters: [String: Any] = [:]
		var tempParameters: [[String: Any]] = []
		
		if let lastMakNum {
			tempParameters.append(["lastMakNum": lastMakNum])
		}
		
		if let categories {
			let categoriesString = categories.joined(separator: ",")
			tempParameters.append(["category": categoriesString])
		}
		
		if let sort {
			tempParameters.append(["sort": sort])
		}
		
		for item in tempParameters {
			for (key, value) in item {
				parameters[key] = value
			}
		}
		
		let response = try await MakgeolliAPI.request(
			target: MakgeolliAPI.fetchMakgeolliList(parameters: parameters),
			dataType: MakgeolliListResponse.self
		)
		return response
	}
	
	/// 서버에서 막걸리 정보 가져오기
	public func fetchMakgeolliInfo(makNumber: Int) async throws -> MakHoly {
		let request: [String: Any] = try MakgeolliInfoRequest(makNumber: makNumber).asDictionary()
		let response = try await MakgeolliAPI.request(target: MakgeolliAPI.fetchMakgeolliInfo(
			parameter: request), dataType: MakgeolliInfoResponse.self
		)
		if let result = response.result {
			return result.toEntity
		}
		
		// 에릭이 MakHoly emptyView init 만들면 그걸로 수정하기
		return MakHoly(makHolyMini: MakHolyMini.test1,
					   comments: [],
					   awards: [],
					   likeUsers: [],
					   dislikeUsers: [],
					   bookmarkUsers: [],
					   ingredients: "",
					   description: "",
					   brewery: Brewery.mockADA)
	}
	
	public func fetchMakgeolliLikesAndComments(makNumber: Int) async throws -> MakgeolliLikesAndCommentResponse {
		let request: [String: Any] = try MakgeolliLikesAndCommentsRequest(
			makNumber: makNumber
		).asDictionary()
		let response = try await MakgeolliAPI.request(target: MakgeolliAPI.fetchMakgeolliLikesAndComments(
			parameter: request), dataType: MakgeolliLikesAndCommentResponse.self
		)
		return response
	}
}
