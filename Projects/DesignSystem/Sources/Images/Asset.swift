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
		
		case scorelarge0
		case scorelarge1
		case scorelarge2
		case scorelarge3
		case scorelarge4
		case scorelarge5
		case scoremini0
		case scoremini1
		case scoremini2
		case scoremini3
		case scoremini4
		case scoremini5
		case scoresmall0
		case scoresmall1
		case scoresmall2
		case scoresmall3
		case scoresmall4
		case scoresmall5

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
				
			case .scorelarge0:
				return "scorelarge0"
			case .scorelarge1:
				return "scorelarge1"
			case .scorelarge2:
				return "scorelarge2"
			case .scorelarge3:
				return "scorelarge3"
			case .scorelarge4:
				return "scorelarge4"
			case .scorelarge5:
				return "scorelarge5"
			case .scoremini0:
				return "scoremini0"
			case .scoremini1:
				return "scoremini1"
			case .scoremini2:
				return "scoremini2"
			case .scoremini3:
				return "scoremini3"
			case .scoremini4:
				return "scoremini4"
			case .scoremini5:
				return "scoremini5"
			case .scoresmall0:
				return "scoresmall0"
			case .scoresmall1:
				return "scoresmall1"
			case .scoresmall2:
				return "scoresmall2"
			case .scoresmall3:
				return "scoresmall3"
			case .scoresmall4:
				return "scoresmall4"
			case .scoresmall5:
				return "scoresmall5"
			}
		}
	}
}
