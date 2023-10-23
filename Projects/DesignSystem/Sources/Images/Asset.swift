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
		
		case logo
		
		case 강원
		case 충북
		case 충남
		case 제주
		case 울릉
		case 경북
		case 경남
		case 경기
		case 서울
		case 대구
		
		case additive
		case alcohol
		case refresh
		case sour
		case sweet
		case thick
		
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
				
			case .logo:
				return "logo"
				
			case .강원:
				return "강원"
			case .충북:
				return "충북"
			case .충남:
				return "충남"
			case .제주:
				return "제주"
			case .울릉:
				return "울릉"
			case .경북:
				return "경북"
			case .경남:
				return "경남"
			case .경기:
				return "경기"
			case .서울:
				return "서울"
			case .대구:
				return "대구"
				
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
