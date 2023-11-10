//
//  RecentComments.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/07.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct RecentCommentsResponse: Codable {
	public let status: Int
	public let resultMsg: String
	public let result: [RecentComment]?
}

public struct RecentComment: Hashable, Codable {
	public let makNumber: Int?
	public let makName: String?
	public let makImageNumber: String?
	public let commentInfo: CommentInfo?
	
	public static func == (lhs: RecentComment,
						   rhs: RecentComment) -> Bool {
		return lhs.makNumber == rhs.makNumber
	}
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(makNumber)
	}
}

public struct CommentInfo: Codable {
	public let userNickName: String?
	public let userLikeOrNot: String?
	public let contents: String?
	public let writeDate: String?
}
