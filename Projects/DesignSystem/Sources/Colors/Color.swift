//
//  Color.swift
//  DesignSystem
//
//  Created by Kim SungHun on 2023/10/18.
//  Copyright © 2023 com.tenten. All rights reserved.
//

public enum TENTENColor {
	case bgColor
	
	/// 컬러를 불러오기 위한 name space
	public var name: String {
		switch self {
		case .bgColor: return "bgColor"
		}
	}
}
