//
//  LikeDetail.swift
//  Core
//
//  Created by Eric Lee on 11/6/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct LikeDetail {
	
	public var totalCount: Int
	public var likeCount: Int
	public var dislikeCount: Int
	
	public init(
		totalCount: Int,
		likeCount: Int,
		dislikeCount: Int) {
		self.totalCount = totalCount
		self.likeCount = likeCount
		self.dislikeCount = dislikeCount
	}
	
}
