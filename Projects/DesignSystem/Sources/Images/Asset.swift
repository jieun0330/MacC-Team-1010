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
		case refresh
		case sour
		case sweet
		case thick
		case free
		
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
		
		case like
		case sorry
		
		case graph0
		case graph1
		case graph2
		case graph3
		case graph4
		case graph5
		case graphNull
		
		case home
		case search
		case camera
		case heart
		case person
		
		case comment
		case likeLarge
		case sorryLarge
		case heartSmall
		case heartSmallNoColor
		case noComment
		case isSelectedFalse
		case isSelectedTrue
		case lock
		case nothingLike
		
		case banner
		
		case character
		
		case visibleTrue
		case visibleFalse
		
		case errorImage
		
		case numBox
		case circle
		case numBox_warmRed
		
		case shutter
        
        case ju1
        case ju2
        case ju3
        case ju4
        case ju5
        case ju6
        case ju7
        case ju8
        case ju9
        case ju10
        case ju11
        case ju12
        case ju13
        case ju14
        case ju15
        case ju16
        case ju17
        case ju18
        case ju19
        case ju20
		
		public var description: String {
			switch self {
			case .mockMakgeolli:
				return "MockMakgeolli"
				
			case .additive:
				return "additive"
			case .refresh:
				return "refresh"
			case .sour:
				return "sour"
			case .sweet:
				return "sweet"
			case .thick:
				return "thick"
			case .free:
				return "free"
				
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
				
			case .like:
				return "like"
			case .sorry:
				return "sorry"
			case .graph0:
				return "graph0"
			case .graph1:
				return "graph1"
			case .graph2:
				return "graph2"
			case .graph3:
				return "graph3"
			case .graph4:
				return "graph4"
			case .graph5:
				return "graph5"
			case .graphNull:
				return "graphNull"
				
			case .home:
				return "home"
			case .search:
				return "search"
			case .camera:
				return "camera"
			case .heart:
				return "heart"
			case .person:
				return "person"
				
			case .comment:
				return "comment"
			case .likeLarge:
				return "likeLarge"
			case .sorryLarge:
				return "sorryLarge"
			case .heartSmall:
				return "heartSmall"
			case .heartSmallNoColor:
				return "heartSmallNoColor"
			case .noComment:
				return "noComment"
			case .isSelectedTrue:
				return "isSelectedTrue"
			case .isSelectedFalse:
				return "isSelectedFalse"
			case .lock:
				return "lock"
			case .nothingLike:
				return "nothingLike"
				
			case .banner:
				return "banner"
				
			case .character:
				return "character"
				
			case .visibleTrue:
				return "visibleTrue"
			case .visibleFalse:
				return "visibleFalse"
				
			case .errorImage:
				return "errorImage"
				
			case .numBox:
				return "numBox"
			case .circle:
				return "circle"
			case .numBox_warmRed:
				return "numBox_warmRed"
				
			case .shutter:
				return "shutter"
                
            case .ju1:
                return "ju1"
            case .ju2:
                return "ju2"
            case .ju3:
                return "ju3"
            case .ju4:
                return "ju4"
            case .ju5:
                return "ju5"
            case .ju6:
                return "ju6"
            case .ju7:
                return "ju7"
            case .ju8:
                return "ju8"
            case .ju9:
                return "ju9"
            case .ju10:
                return "ju10"
            case .ju11:
                return "ju11"
            case .ju12:
                return "ju12"
            case .ju13:
                return "ju13"
            case .ju14:
                return "ju14"
            case .ju15:
                return "ju15"
            case .ju16:
                return "ju16"
            case .ju17:
                return "ju17"
            case .ju18:
                return "ju18"
            case .ju19:
                return "ju19"
            case .ju20:
                return "ju20"
			}
		}
	}
}
