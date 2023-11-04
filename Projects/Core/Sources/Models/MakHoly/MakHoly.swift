//
//  MakHoly.swift
//  Core
//
//  Created by Eric Lee on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct MakHoly: Identifiable, Hashable {
	
	public static func == (lhs: MakHoly, rhs: MakHoly) -> Bool {
		return lhs.id == rhs.id
	}
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	
	public init (
		makHolyMini: MakHolyMini,
		comments: [Comment],
		awards: [Award],
		likeUsers: [String],
		dislikeUsers: [String],
		bookmarkUsers: [String],
		ingredients: String,
		description: String,
		brewery: Brewery
	) {
		self.id = makHolyMini.id
		self.name = makHolyMini.name
		self.imageId = makHolyMini.imageId
		self.sweetness = makHolyMini.sweetness
		self.sourness = makHolyMini.sourness
		self.thickness = makHolyMini.thickness
		self.freshness = makHolyMini.freshness
		self.price = makHolyMini.price
		self.volume = makHolyMini.volume
		self.adv = makHolyMini.adv
		self.ingredients = ingredients
		self.description = description
		
		self.brewery = brewery
		
		self.comments = comments
		self.awards = awards
		
		self.likeUsers = likeUsers
		self.dislikeUsers = dislikeUsers
		self.bookmarkUsers = bookmarkUsers
	}
	
	public let id: String // 막걸리 ID - Seq
	public let name: String // 막걸리 이름
	public let imageId: String // 이미지 ID
	public let sweetness: Int // 단맛 점수
	public let sourness: Int // 신맛 점수
	public let thickness: Int // 걸쭉 점수
	public let freshness: Int // 청량 점수
	public let price: Int // 가격
	public let volume: Int // 용량
	public let adv: Double // 알코올 도수
	public let ingredients: String // 원재료
	public let description: String // 막걸리 설명
	
	public let brewery: Brewery // 브루어리
	
	public let comments: [Comment] // 코멘트 리스트 모음
	public let awards: [Award] // 수상 리스트
	
	public let likeUsers: [String] // 유저 ID
	public let dislikeUsers: [String] // 유저 ID
	public let bookmarkUsers: [String] // 유저 ID
}
