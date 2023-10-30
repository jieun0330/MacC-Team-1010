//
//  Color.swift
//  DesignSystem
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

public enum TENTENColor {
	case darkbase
	
	case darkGrey
	case lightgrey
	
	case goldenyellow
	case primary
	
	case white
	case w75
	case w60
	case w50
	case w40
	case w25
	case w20
	case w10
	
	case lilac
	
	/// 컬러를 불러오기 위한 name space
	public var name: String {
		switch self {
		case .darkbase: return "darkbase"
			
		case .darkGrey: return "darkGrey"
		case .lightgrey: return "lightgrey"
			
		case .goldenyellow: return "goldenyellow"
		case .primary: return "primary"
			
		case .white: return "white"
		case .w75: return "w75"
		case .w60: return "w60"
		case .w50: return "w50"
		case .w40: return "w40"
		case .w25: return "w25"
		case .w20: return "w20"
		case .w10: return "w10"
			
		case .lilac: return "lilac"
		}
	}
}
