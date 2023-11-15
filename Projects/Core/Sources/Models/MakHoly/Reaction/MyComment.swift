//
//  MyComment.swift
//  Core
//
//  Created by Eric Lee on 11/6/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct MyComment {
	/// 공개 여부
	public var isVisible: Bool
	/// 코멘트 내용
	public var contents: String
	///  코멘트 작성 날짜
	public var date: String
	
	public init(
		isVisible: Bool,
		contents: String,
		date: String) {
			self.isVisible = isVisible
			self.contents = contents
			self.date = date
		}
	
	public init() {
		self.init(isVisible: false, contents: "", date: "")
	}
}
