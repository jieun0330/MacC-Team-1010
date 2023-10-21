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
		
		case mockImage
		case haechang12
		case haechang9
		case bokson
		case neulinmaeul
		case palpal
		case nalu6
		case nalu11
		case yusangyun
		case markholy
		case damun
		
		public var description: String {
			switch self {
			case .mockImage:
				return "MockMakgeolli"
			case .haechang12:
				return "haechang12"
			case .haechang9:
				return "haechang9"
			case .bokson:
				return "bokson"
			case .neulinmaeul:
				return "neulinmaeul"
			case .palpal:
				return "palpal"
			case .nalu6:
				return "nalu6"
			case .nalu11:
				return "nalu11"
			case .yusangyun:
				return "yusangyun"
			case .markholy:
				return "markholy"
			case .damun:
				return "damun"
			}
		}
	}
}
