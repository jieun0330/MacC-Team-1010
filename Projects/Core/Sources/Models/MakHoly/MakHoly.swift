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
	/// 막걸리 ID
	public let id: String
	/// 막걸리 이름
	public let name: String
	/// 이미지 Id
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
	/// 원재료
	public let ingredients: String
	/// 막걸리 설명
	public let description: String
	
	/// 양조장
	public let brewery: Brewery
	
	/// 코멘트 배열
	public let comments: [Comment]
	/// 수상 배열
	public let awards: [Award]
	
	/// 좋아요 유저 ID 배열
	public let likeUsers: [String]
	/// 싫어요 유저 ID 배열
	public let dislikeUsers: [String]
	/// 북마크 유저 ID 배열
	public let bookmarkUsers: [String]
}
