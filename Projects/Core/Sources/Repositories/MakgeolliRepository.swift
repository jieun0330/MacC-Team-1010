//
//  MakgeolliRepository.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Utils

public protocol MakgeolliRepository {
	func fetchMakgeolliInfo(makNumber: Int) async throws -> MakHoly
	func fetchMakgeolliAddInfo(makNumber: Int) async throws -> MakgeolliAddInfoResponse
	func fetchMakgeolliList(lastMakNum: Int?,
							categories: [String]?,
							sort: String?) async throws -> MakgeolliListResponse
}

public final class DefaultMakgeolliRepository: MakgeolliRepository {
	let db = Firestore.firestore()
	
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
	
	/// 파이어베이스에서 막걸리에 대한 추가정보(like, bad, review...)  가져오기
	public func fetchMakgeolliAddInfo(makNumber: Int) async throws -> MakgeolliAddInfoResponse {
		return try await withUnsafeThrowingContinuation { configuration in
			db.collection("Makgeolli").getDocuments { snapshot, error in
				guard let snapshot else { return }
				if let document = snapshot.documents.first(where: { $0.documentID == String(makNumber) }) {
					let data = document.data()
					let review = data["review"] as! [String]
					let like = data["like"] as! [String]
					let bad = data["bad"] as! [String]
					let bookmark = data["bookmark"] as! [String]
					let docID = data["docID"] as! String
					let makgeolli = MakgeolliAddInfoResponse(review: review,
															 like: like,
															 bad: bad,
															 bookmark: bookmark,
															 docID: docID)
					configuration.resume(returning: makgeolli)
				}
			}
		}
	}
}
