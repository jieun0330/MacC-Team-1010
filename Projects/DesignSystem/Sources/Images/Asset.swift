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
		
		case scoreLarge0
		case scoreLarge1
		case scoreLarge2
		case scoreLarge3
		case scoreLarge4
		case scoreLarge5
		case scoreLargeNull
		
		case scoreMini0
		case scoreMini1
		case scoreMini2
		case scoreMini3
		case scoreMini4
		case scoreMini5
		case scoreMiniNull
		
		case scoreSmall0
		case scoreSmall1
		case scoreSmall2
		case scoreSmall3
		case scoreSmall4
		case scoreSmall5
		case scoreSmallNull
		
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
				
			case .scoreLarge0:
				return "scorelarge0"
			case .scoreLarge1:
				return "scorelarge1"
			case .scoreLarge2:
				return "scorelarge2"
			case .scoreLarge3:
				return "scorelarge3"
			case .scoreLarge4:
				return "scorelarge4"
			case .scoreLarge5:
				return "scorelarge5"
			case .scoreLargeNull:
				return "scorelargeNull"
				
			case .scoreMini0:
				return "scoremini0"
			case .scoreMini1:
				return "scoremini1"
			case .scoreMini2:
				return "scoremini2"
			case .scoreMini3:
				return "scoremini3"
			case .scoreMini4:
				return "scoremini4"
			case .scoreMini5:
				return "scoremini5"
			case .scoreMiniNull:
				return "scoreminiNull"
				
			case .scoreSmall0:
				return "scoresmall0"
			case .scoreSmall1:
				return "scoresmall1"
			case .scoreSmall2:
				return "scoresmall2"
			case .scoreSmall3:
				return "scoresmall3"
			case .scoreSmall4:
				return "scoresmall4"
			case .scoreSmall5:
				return "scoresmall5"
			case .scoreSmallNull:
				return "scoresmallNull"
				
			}
		}
	}
}
