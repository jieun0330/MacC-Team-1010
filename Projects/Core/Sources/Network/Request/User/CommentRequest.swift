//
//  CommentRequest.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/06.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct InsertCommentRequest: Codable {
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
	
	public init(userId: Int, makNumber: Int, contents: String, isVisible: Bool) {
		 self.init(
			 userId: userId,
			 makNumber: makNumber,
			 contents: contents,
			 isVisible: isVisible ? "Y" : "N")
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
	
	public init(userId: Int, makNumber: Int, contents: String, isVisible: Bool) {
		 self.init(
			 userId: userId,
			 makNumber: makNumber,
			 contents: contents,
			 isVisible: isVisible ? "Y" : "N")
	 }
}

public struct DeleteCommentRequest: Codable {
    public let userId: Int
    public let makNumber: Int

    public init(userId:Int, makNumber: Int) {
        self.userId = userId
        self.makNumber = makNumber
    }
}
