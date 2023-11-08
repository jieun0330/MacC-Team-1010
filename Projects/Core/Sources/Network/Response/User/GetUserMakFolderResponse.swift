//
//  GetUserMakFolderResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/07.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct GetUserMakFolderResponse: Codable {
	public let status: Int
	public let resultMsg: String
	public let result: GetUserMakFolderResult?
}

public struct GetUserMakFolderResult: Codable {
	public let userId: String?
	public let makInfo: [MakInfo]?
	public let totalCounts: Int?
	public let nextCursor: Int?
	public let pageInfo: GetUserMakFolderResponsePageInfo?
}

public struct MakInfo: Codable {
	public let makNumber: Int?
	public let makName: String?
	public let makImage: String?
}

public struct GetUserMakFolderResponsePageInfo: Codable {
	public let currentPage: Int?
	public let size: Int?
	public let first: Bool?
	public let last: Bool?
	public let totalMakElements: Int?
	public let totalPages: Int?
}
