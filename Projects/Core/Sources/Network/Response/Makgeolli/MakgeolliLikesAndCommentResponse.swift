//
//  MakgeolliLikesAndCommentResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/06.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct MakgeolliLikesAndCommentResponse: Codable {
	public let status: Int?
	public let resultMsg: String?
	public let result: ResultData?
}

public struct ResultData: Codable {
	public let makEvaluateInfo: MakEvaluateInfo?
	public let comments: [Comments]?
	public let pageableInfo: PageableInfo?
}

public struct MakEvaluateInfo: Codable {
	public let totalEvaluateCounts: Int?
	public let likeCounts: Int?
	public let dislikeCounts: Int?
}

public struct Comments: Codable {
	public let userNickName: String?
	public let userLikeOrNot: String?
	public let contents: String?
	public let writeDate: String?
}

public struct PageableInfo: Codable {
	public let currentPage: Int?
	public let size: Int?
	public let first: Bool?
	public let last: Bool?
	public let totalMakElements: Int?
	public let totalPages: Int?
}
