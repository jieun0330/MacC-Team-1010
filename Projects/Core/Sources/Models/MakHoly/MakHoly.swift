//
//  MakHoly.swift
//  Core
//
//  Created by Eric Lee on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct MakHoly: Identifiable, Codable {
	
	public var id: String
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
	public var likeState: LikeState /// 좋았어요 상태
	public var bookMark: Bool /// 찜하기
	public var comment: String? /// 코멘트
	public var reviews: [Review] /// 리뷰들
	
}
