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
    
    public init(userId: String, makNumber: Int, contents: String, isVisible: String) {
        self.userId = userId
        self.makNumber = makNumber
        self.contents = contents
        self.isVisible = isVisible
    }
}

public struct UpdateCommentRequest: Codable {
    public let userId: Int
    public let makNumber: Int
    public let contents: String
    public let isVisible: String
    
    public init(userId: Int, makNumber: Int, contents: String, isVisible: String) {
        self.userId = userId
        self.makNumber = makNumber
        self.contents = contents
        self.isVisible = isVisible
    }
}

public struct DeleteCommentRequest: Codable {
    public let commentId: String
    public let isUserDeleteComment: String
    
    public init(commentId: String, isUserDeleteComment: String) {
        self.commentId = commentId
        self.isUserDeleteComment = isUserDeleteComment
    }
}
