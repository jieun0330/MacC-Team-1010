//
//  Review.swift
//  Core
//
//  Created by Eric Lee on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct Review: Codable {
	public let name: String /// 리뷰어 이름
	public let likeState: LikeState /// 좋았어요 상태
	public let comment: String? /// 코멘트
	public let date: String /// 리뷰 작성 시각
}
