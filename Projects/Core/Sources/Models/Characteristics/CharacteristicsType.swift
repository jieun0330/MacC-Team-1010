//
//  CharacteristicsType.swift
//  Core
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import UIKit
import DesignSystem

public enum CharacteristicsType: String, CaseIterable, Hashable {
	case sweet
	case thick
	case sour
	case fresh
	case additive
	
	public var description: String {
		switch self {
		case .sweet:
			return "달달한"
		case .thick:
			return "걸쭉한"
		case .sour:
			return "시큼한"
		case .fresh:
			return "탄삼감 좋은"
		case .additive:
			return "아스파탐이 없는"
		}
	}
	
	public var scoreDescription: String {
		switch self {
		case .sweet:
			return "sweetness"
		case .thick:
			return "thickness"
		case .sour:
			return "sourness"
		case .fresh:
			return "freshness"
		default:
			return ""
		}
	}
	
	public var characteristicsImage: UIImage {
		switch self {
		case .sweet:
			return .designSystem(.sweet)!
		case .thick:
			return .designSystem(.thick)!
		case .sour:
			return .designSystem(.sour)!
		case .fresh:
			return .designSystem(.refresh)!
		case .additive:
			return .designSystem(.additive)!
		}
	}
}
