//
//  Asset.swift
//  DesignSystem
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public enum TENTENAsset {
	/// 에셋의 이름
	/// - 에셋 추가시 case와 case 에 따른 description을 추가해야합니다.
	public enum name {
		
		case mockMakgeolli
		
		case additive
		case alcohol
		case refresh
		case sour
		case sweet
		case thick

		public var description: String {
			switch self {
			case .mockMakgeolli:
				return "MockMakgeolli"
				
			case .additive:
				return "additive"
			case .alcohol:
				return "alcohol"
			case .refresh:
				return "refresh"
			case .sour:
				return "sour"
			case .sweet:
				return "sweet"
			case .thick:
				return "thick"
			}
		}
	}
}
