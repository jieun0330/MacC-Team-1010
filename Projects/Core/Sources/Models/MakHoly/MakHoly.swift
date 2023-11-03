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
		id.hash(into: &hasher)
	}
	
	public var id: String /// 막걸리 ID
	public let name: String /// 막걸리 이름
	public let imageURL: String /// 막걸리 이미지
	public let adv: Double /// 도수
	public let volume: Int /// 용량
	public let price: Int /// 가격
	public let taste: Taste /// 맛 정보
	public let description: String /// 소개 내용
	public let awards: [Award] ///수상 정보 배열
	public let ingredients: [String] /// 원재료 배열
	public let salesURL: String? /// 판매 사이트
	public let brewery: Brewery /// 양조장
	public var isBookMarked: Bool /// 찜하기
	public var myLikeState: LikeState /// 좋았어요 상태
	public var myComment: Comment? /// 코멘트
	public var reviews: [Review] /// 리뷰들
	
	public init(id: String, name: String, imageURL: String, adv: Double, volume: Int, price: Int, taste: Taste, description: String, awards: [Award], ingredients: [String], salesURL: String?, brewery: Brewery, myLikeState: LikeState, isBookMarked: Bool, myComment: Comment?, reviews: [Review]) {
		self.id = id
		self.name = name
		self.imageURL = imageURL
		self.adv = adv
		self.volume = volume
		self.price = price
		self.taste = taste
		self.description = description
		self.awards = awards
		self.ingredients = ingredients
		self.salesURL = salesURL
		self.brewery = brewery
		self.myLikeState = myLikeState
		self.isBookMarked = isBookMarked
		self.myComment = myComment
		self.reviews = reviews
	}
	
	public func formattedSet() -> String {
		return self.adv.formattedAdv() + " ・ " + self.volume.formattedVolume() + " ・ " + self.price.formattedPrice()
	}
}
