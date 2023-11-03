//
//  MakHolyMini.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/03.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct MakHolyMini {
	public let id: String // 막걸리 ID - Seq
	public let name: String // 막걸리 이름
	public let imageId: String // 이미지 ID
	public let sweetness: String // 단맛 점수
	public let sourness: String // 신맛 점수
	public let thickness: String // 걸쭉 점수
	public let freshness: String // 청량 점수
	public let price: String // 가격
	public let volume: String // 용량
	public let adv: String // 알코올 도수
	
	public init(id: String,
				name: String,
				imageId: String,
				sweetness: String,
				sourness: String,
				thickness: String,
				freshness: String,
				price: String,
				volume: String,
				adv: String
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
