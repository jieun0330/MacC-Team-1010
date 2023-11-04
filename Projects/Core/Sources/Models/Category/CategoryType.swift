//
//  CategoryType.swift
//  Core
//
//  Created by Kim SungHun on 2023/10/21.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public enum CategoryType {
	/// 특징으로 찾기
	case characteristics
	/// 주룩 개발자 픽
	case event
	/// 새로 나왔어요
	case new
	
	public var description: String {
		switch self {
		case .characteristics:
			return "특징으로 찾기"
		case .event:
			return "주룩 개발자 픽"
		case .new:
			return "새로 나왔어요"
		}
	}
}
