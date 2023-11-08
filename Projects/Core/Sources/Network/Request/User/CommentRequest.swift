//
//  CommentRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/06.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct InsertCommentRequest: Codable {
	let userId: String
	let makNumber: Int
	let contents: String
	let isVisible: String
}

public struct UpdateCommentRequest: Codable {
	let commentId: String
	let contents: String
	let isVisible: String
}

public struct DeleteCommentRequest: Codable {
	let commentId: String
	let isUserDeleteComment: String
}
