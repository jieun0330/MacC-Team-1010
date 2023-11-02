//
//  Review.swift
//  Core
//
//  Created by Eric Lee on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct Review {
	
	public let name: String /// 리뷰어 이름
	public let likeState: LikeState /// 좋았어요 상태
	public let comment: Comment? /// 코멘트
	
	public init(name: String, likeState: LikeState, comment: Comment?) {
		self.name = name
		self.likeState = likeState
		self.comment = comment
	}
}
