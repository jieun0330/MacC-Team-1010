//
//  MPSearchMethod.swift
//  Core
//
//  Created by Eric Lee on 11/26/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public enum MPSearchMethod: MPPropertiable {
	case auto
	case submit
	
	var mpProperty: String {
		return "method"
	}
	
	var mpMixpanelType: String {
		switch self {
		case .auto:
			return "자동 검색"
		case .submit:
			return "제출 검색"
		}
	}
}
