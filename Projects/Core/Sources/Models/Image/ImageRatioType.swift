//
//  ImageRatioType.swift
//  Core
//
//  Created by Eric Lee on 11/4/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public enum ImageRatioType {
	case cover
	case contain
	case inside
	case outside
	case fill
	
	public var query: String {
		switch self {
		case .cover:
			return "t=cover"
		case .contain:
			return "t=contain"
		case .inside:
			return "t=inside"
		case .outside:
			return "t=outside"
		case .fill:
			return "t=fill"
		}
	}
}
