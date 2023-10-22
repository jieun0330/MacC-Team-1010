//
//  Color.swift
//  DesignSystem
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

public enum TENTENColor {
	case bgColor
	
	case additiveColor
	case alcoholColor
	case refreshColor
	case sourColor
	case sweetColor
	case thickColor
	
	case tempDarkGrayColor
	case tempLightGrayColor
	case tempBackButtonGrayColor
  
    case tasteCircle
    case grayFont
    case blueTemp
    case blackBlock
    case yellowHeart

	
    case searchAccentColor
    
	/// 컬러를 불러오기 위한 name space
	public var name: String {
		switch self {
		case .bgColor: return "bgColor"
		case .additiveColor: return "additiveColor"
		case .alcoholColor: return "alcoholColor"
		case .refreshColor: return "refreshColor"
		case .sourColor: return "sourColor"
		case .sweetColor: return "sweetColor"
		case .thickColor: return "thickColor"
		case .tempDarkGrayColor: return "tempDarkGrayColor"
		case .tempLightGrayColor: return "tempLightGrayColor"
      		case .tempBackButtonGrayColor: return "tempBackButtonGrayColor"
            
        case .tasteCircle: return "tasteCircle"
        case .grayFont: return "grayFont"
        case .blueTemp: return "blueTemp"
        case .blackBlock: return "blackBlock"
        case .yellowHeart: return "yellowHeart"

        case .searchAccentColor: return "searchAccentColor"
		}
	}
}
