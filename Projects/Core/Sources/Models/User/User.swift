//
//  User.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/03.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct User {
	/// 유저  Id
	public let id: String
	/// 유저 닉네임
	public let name: String
	/// 찜 막걸리 ID 리스트
	public let bookmarks: [String]
	/// 좋았어요 막걸리 ID 리스트
	public let likes: [String] 	
	/// 아쉬워요 막걸리 ID 리스트
	public let dislikes: [String]
	/// 코멘트 ID 리스트
	public let comments: [String]
	
	public init(id: String,
				name: String,
				bookmarks: [String],
				likes: [String],
				dislikes: [String],
				comments: [String]
	) {
		self.id = id
		self.name = name
		self.bookmarks = bookmarks
		self.likes = likes
		self.dislikes = dislikes
		self.comments = comments
	}
}
