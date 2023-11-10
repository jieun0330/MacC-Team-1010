//
//  Taste.swift
//  Core
//
//  Created by Eric Lee on 11/9/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct Taste {
	/// 단맛 점수
	public let sweetness: Int
	/// 신맛 점수
	public let sourness: Int
	/// 걸쭉 점수
	public let thickness: Int
	/// 청량 점수
	public let freshness: Int
	
	public init(
		sweetness: Int,
		sourness: Int,
		thickness: Int,
		freshness: Int) {
		self.sweetness = sweetness
		self.sourness = sourness
		self.thickness = thickness
		self.freshness = freshness
	}
	
	public init() {
		self.init(sweetness: -1, sourness: -1, thickness: -1, freshness: -1)
	}
}
