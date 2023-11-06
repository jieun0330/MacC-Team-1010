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
		
		if lastMakNum != nil {
			tempParameters.append(["lastMakNum": lastMakNum!])
		}
		
		if categories != nil {
			let categoriesString = categories!.joined(separator: ",")
			tempParameters.append(["category": categoriesString])
		}
		
		if sort != nil {
			tempParameters.append(["sort": sort!])
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
		return response.result!.toEntity
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
