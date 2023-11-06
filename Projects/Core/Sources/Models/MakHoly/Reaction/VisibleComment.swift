//
//  VisibleComment.swift
//  Core
//
//  Created by Eric Lee on 11/6/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct VisibleComment: Identifiable, Hashable {
	
	/// Comment Id
	public let id: UUID = UUID()
	
	/// 유저 이름
	public let userName: String
	/// 좋아요 여부
	public let isLiked: LikeState
	/// 코멘트 작성 날짜
	public let date: String
	
	public init(userName: String, isLiked: Bool?, date: String) {
		self.userName = userName
		self.isLiked = .init(isLiked)
		self.date = date
	}
	
}
