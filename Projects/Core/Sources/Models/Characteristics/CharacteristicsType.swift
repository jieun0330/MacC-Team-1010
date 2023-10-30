//
//  CharacteristicsType.swift
//  Core
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import UIKit
import DesignSystem

public enum CharacteristicsType: CaseIterable, Hashable {
	case sweet
	case thick
	case sour
	case refresh
	case alcohol
	case additive
	
	public var description: String {
		switch self {
		case .sweet:
			return "달달한"
		case .thick:
			return "걸쭉한"
		case .sour:
			return "시큼한"
		case .refresh:
			return "청량감이 있는"
		case .alcohol:
			return "도수가 높은"
		case .additive:
			return "아스파탐이 없는"
		}
	}
	
//	public var characteristicsImage: UIImage {
//		switch self {
//		case .sweet:
//			return .designSystem(.sweet)!
//		case .thick:
//			return .designSystem(.thick)!
//		case .sour:
//			return .designSystem(.sour)!
//		case .refresh:
//			return .designSystem(.refresh)!
//		case .alcohol:
//			return .designSystem(.alcohol)!
//		case .additive:
//			return .designSystem(.additive)!
//		}
//	}
}
