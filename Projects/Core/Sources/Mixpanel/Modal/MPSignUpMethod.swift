//
//  MPSignUpMethod.swift
//  Core
//
//  Created by Eric Lee on 11/26/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public enum MPSignUpMethod: MPPropertiable {
	case ShortCut
	case PhoneNum
	case PhoneNumLoad
	
	var mpProperty: String {
		return "method"
	}
	
	var mpMixpanelType: String {
		switch self {
		case .ShortCut:
			return "간편 가입"
		case .PhoneNum:
			return "전화번호 가입"
		case .PhoneNumLoad:
			return "전화번호 백업 불러오기 로그인"
		}
	}
}
