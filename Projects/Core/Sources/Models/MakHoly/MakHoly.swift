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
		id: Int,
		name: String,
		imageId: String,
		taste: Taste,
		basicInfo: BasicInfo,
		ingredients: String,
		description: String,
		brewery: Brewery,
		awards: [Award]) {
			self.id = id
			self.name = name
			self.imageId = imageId
			self.taste = taste
			self.basicInfo = basicInfo
			self.ingredients = ingredients
			self.description = description
			self.brewery = brewery
			self.awards = awards
		}
	
	public init() {
		self.init(
			id: -1,
			name: "",
			imageId: "",
			taste: Taste(),
			basicInfo: BasicInfo(),
			ingredients: "",
			description: "",
			brewery: Brewery(),
			awards: [])
	}
	
	// MakHoli Mini 정보
	/// 막걸리 ID
	public let id: Int
	/// 막걸리 이름
	public let name: String
	/// 이미지 Id
	public let imageId: String
	
	/// 맛 정보
	public let taste: Taste
	
	/// 기본정보 (용량, 도수, 가격)
	public let basicInfo: BasicInfo
	
	// 막걸리 상세 정보
	/// 원재료
	public let ingredients: String
	/// 막걸리 설명
	public let description: String
	/// 양조장
	public let brewery: Brewery
	/// 수상 배열
	public let awards: [Award]
}
