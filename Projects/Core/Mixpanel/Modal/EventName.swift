//
//  EventName.swift
//  Core
//
//  Created by Eric Lee on 11/26/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public enum EventName {
	
	case signup
	case suggestMakHoly
	case searchSubmit
	case informationviewClosed
	case hastagviewClosed
	
	public var mpName: String {
		switch self {
		case .signup:
			return "Sign_Up"
		case .suggestMakHoly:
			return "Suggest_Makholy"
		case .searchSubmit:
			return "Search_Submit"
		case .informationviewClosed:
			return "InformationView_Closed"
		case .hastagviewClosed:
			return "HastagView_Closed"
		}
	}
	
}
