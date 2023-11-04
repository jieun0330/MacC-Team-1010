//
//  MakHolyMini.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/03.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct MakHolyMini: Identifiable, Hashable {
	/// 막걸리 ID
	public let id: String
	///막걸리 이름
	public let name: String
	/// 이미지 ID
	public let imageId: String
	/// 단맛 점수
	public let sweetness: Int
	/// 신맛 점수
	public let sourness: Int
	/// 걸쭉 점수
	public let thickness: Int
	/// 청량 점수
	public let freshness: Int
	/// 가격
	public let price: Int
	/// 용량
	public let volume: Int
	/// 도수
	public let adv: Double
	
	public init(id: String,
				name: String,
				imageId: String,
				sweetness: Int,
				sourness: Int,
				thickness: Int,
				freshness: Int,
				price: Int,
				volume: Int,
				adv: Double
	) {
		self.id = id
		self.name = name
		self.imageId = imageId
		self.sweetness = sweetness
		self.sourness = sourness
		self.thickness = thickness
		self.freshness = freshness
		self.price = price
		self.volume = volume
		self.adv = adv
	}
}
