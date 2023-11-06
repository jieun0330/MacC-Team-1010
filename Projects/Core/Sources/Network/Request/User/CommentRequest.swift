//
//  CommentRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/06.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct InsertCommentRequest: Codable {
	public let userId: String
	public let makNumber: Int
	public let contents: String
	public let isVisible: String
}

public struct UpdateCommentRequest: Codable {
	public let commentId: String
	public let contents: String
	public let isVisible: String
}

public struct DeleteCommentRequest: Codable {
	public let commentId: String
	public let isUserDeleteComment: String
}
