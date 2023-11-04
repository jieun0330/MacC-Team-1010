//
//  Color.swift
//  DesignSystem
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

public enum TENTENColor {
	case darkbase
	case darkgrey
	case darkwindow
	
	case goldenyellow
	case primary

	case white
	case w85
	case w50
	case w25
	case w10
	
	case lilac
	case primary2
	
	/// Color name space
	public var name: String {
		switch self {
		case .darkbase: return "darkbase"
		case .darkgrey: return "darkgrey"
		case .darkwindow: return "darkwindow"
			
		case .goldenyellow: return "goldenyellow"
		case .primary: return "primary"
			
		case .white: return "white"
		case .w85: return "w85"
		case .w50: return "w50"
		case .w25: return "w25"
		case .w10: return "w10"
			
		case .lilac: return "lilac"
		case .primary2: return "primary2"
		}
	}
}
