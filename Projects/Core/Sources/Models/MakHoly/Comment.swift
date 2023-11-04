//
//  Comment.swift
//  Core
//
//  Created by Eric Lee on 11/2/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct Comment: Identifiable, Hashable {
	/// 코멘트 ID
	public let id: String
	/// 막걸리 ID
	public let makHolyId: String
	/// user ID
	public let userId: String
	/// 공개 여부
	public let isOpened: Bool
	/// 코멘트 내용
	public let description: String
	///  코멘트 작성 날짜
	public let date: String
	
	public init(id: String,
				makHolyId: String,
				userId: String,
				isOpened: Bool,
				description: String,
				date: String
	) {
		self.id = id
		self.makHolyId = makHolyId
		self.userId = userId
		self.isOpened = isOpened
		self.description = description
		self.date = date
	}
}
