//
//  Comment.swift
//  Core
//
//  Created by Eric Lee on 11/2/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct Comment {
	public var description: String /// 리뷰 내용
	public var isOpened: Bool /// 리뷰 공개 여부
	public var date: String /// 리뷰 작성 시각
	
	public init(description: String, isOpened: Bool, date: String) {
		self.description = description
		self.isOpened = isOpened
		self.date = date
	}
}
