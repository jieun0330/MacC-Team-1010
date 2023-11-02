//
//  Taste.swift
//  Core
//
//  Created by Eric Lee on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct Taste {
	public let sweetness: TasteScore /// 단맛 점수
	public let sourness: TasteScore /// 신맛 점수
	public let thickness: TasteScore /// 걸쭉 점수
	public let freshness: TasteScore /// 청량 점수
	
	static let descriptions: [String] = ["단맛", "신맛", "걸쭉", "청량"] /// 설명 텍스트
	
	public init(sweetness: TasteScore, sourness: TasteScore, thickness: TasteScore, freshness: TasteScore) {
		self.sweetness = sweetness
		self.sourness = sourness
		self.thickness = thickness
		self.freshness = freshness
	}
}

public enum TasteScore: Int, Codable {
	case none = -1
	case zero
	case one
	case two
	case three
	case four
	case five
}
