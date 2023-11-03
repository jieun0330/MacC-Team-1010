//
//  User.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/03.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct User {
	public let id: String // UUID
	public let name: String // 유저네임
	public let bookmarks: [String] // 찜 목록 - 막걸리 ID 리스트
	public let likes: [String] // 좋았어요 목록 - 막걸리 ID 리스트
	public let dislikes: [String] // 아쉬워요 목록 - 막걸리 ID 리스트
	public let comments: [String] // 코멘트 단 목록 - 코멘트 ID 리스트
	
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
