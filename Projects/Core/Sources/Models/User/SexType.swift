//
//  SexType.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/09.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public enum SexType: String {
	case none, male, female, etc
	
	public var description: String {
		switch self {
		case .none:
			return ""
		case .male:
			return "남성"
		case .female:
			return "여성"
		case .etc:
			return "기타"
		}
	}
}
