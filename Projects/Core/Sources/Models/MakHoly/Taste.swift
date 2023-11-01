//
//  Taste.swift
//  Core
//
//  Created by Eric Lee on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct Taste: Codable {
	public let sweetness: TasteRating? /// 단맛 점수
	public let sourness: TasteRating? /// 신맛 점수
	public let thickness: TasteRating? /// 걸쭉 점수
	public let freshness: TasteRating? /// 청량 점수
	
	static let descriptions: [String] = ["단맛", "신맛", "걸쭉", "청량"] /// 설명 텍스트
}

public enum TasteRating: Int, Codable {
	case zero = 0
	case one
	case two
	case three
	case four
	case five
}
