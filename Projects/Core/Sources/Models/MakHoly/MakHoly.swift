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
	
	public init(
		id: String,
		name: String,
		imageId: String,
		sweetness: Int,
		sourness: Int,
		thickness: Int,
		freshness: Int,
		price: Int,
		volume: Int,
		adv: Double,
		ingredients: String,
		description: String,
		brewery: Brewery,
		awards: [Award],
		isBookMarked: Bool,
		likeState: LikeState,
		myComment: MyComment?) {
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
			self.ingredients = ingredients
			self.description = description
			self.brewery = brewery
			self.awards = awards
			self.isBookMarked = isBookMarked
			self.likeState = likeState
			self.myComment = myComment
		}
	
	public init(
		makHolyMini: MakHolyMini,
		ingredients: String,
		description: String,
		brewery: Brewery,
		awards: [Award],
		isBookMarked: Bool,
		likeState: LikeState,
		myComment: MyComment?) {
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
			self.awards = awards
			self.isBookMarked = isBookMarked
			self.likeState = likeState
			self.myComment = myComment
		}
	
	
	// MakHoli Mini 정보
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
	
	// 막걸리 상세 정보
	/// 원재료
	public let ingredients: String
	/// 막걸리 설명
	public let description: String
	/// 양조장
	public let brewery: Brewery
	/// 수상 배열
	public let awards: [Award]
	
	// 나의 Reaction
	/// 북마크 여부
	public var isBookMarked: Bool
	/// 평가 내용
	public var likeState: LikeState
	/// 코멘트
	public var myComment: MyComment?
	
}
