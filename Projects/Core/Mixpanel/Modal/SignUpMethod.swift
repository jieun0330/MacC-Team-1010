//
//  SignUpMethod.swift
//  Core
//
//  Created by Eric Lee on 11/26/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation
import Mixpanel

public enum SignUpMethod: MPPropertiable {
	case ShortCut
	case PhoneNum
	
	var mpProperty: String {
		return "method"
	}
	
	var mpMixpanelType: String {
		switch self {
		case .ShortCut:
			return "간편 가입"
		case .PhoneNum:
			return "전화번호 가입"
		}
	}
	
}
