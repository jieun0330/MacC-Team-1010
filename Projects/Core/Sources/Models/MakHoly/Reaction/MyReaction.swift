//
//  MyReaction.swift
//  Core
//
//  Created by Eric Lee on 11/9/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct MyReaction {
	/// 북마크 여부
	public var isBookMarked: Bool
	/// 평가 내용
	public var likeState: LikeState
	/// 코멘트
	public var comment: MyComment?
	
	public init(
		isBookMarked: Bool,
		likeState: LikeState,
		comment: MyComment? = nil) {
		self.isBookMarked = isBookMarked
		self.likeState = likeState
		self.comment = comment
	}
	
	public init() {
		self.init(isBookMarked: false, likeState: .none)
	}
}
