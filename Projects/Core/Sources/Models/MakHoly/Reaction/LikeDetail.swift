//
//  LikeDetail.swift
//  Core
//
//  Created by Eric Lee on 11/6/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct LikeDetail {
	
	private let totalCount: Int
	private let likeCount: Int
	private let dislikeCount: Int
	
	public init(
		totalCount: Int,
		likeCount: Int,
		dislikeCount: Int) {
		self.totalCount = totalCount
		self.likeCount = likeCount
		self.dislikeCount = dislikeCount
	}
	
	public init() {
		self.totalCount = 0
		self.likeCount = 0
		self.dislikeCount = 0
	}
	
	public var isEnough: Bool {
		return totalCount > 10
	}
	
	public var likePercent: Int {
		if isEnough {
			return (likeCount * 100) / totalCount
		} else {
			return -1
		}
	}
	
	public var likeText: String {
		if isEnough {
			return "\(likePercent)%"
		} else {
			return "- %"
		}
	}
	
	public var dislikeText: String {
		if isEnough {
			let dislikePercent = 100 - likePercent
			return "\(dislikePercent)%"
		} else {
			return "- %"
		}
	}
	
}
