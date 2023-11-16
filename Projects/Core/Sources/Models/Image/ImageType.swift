//
//  ImageType.swift
//  Core
//
//  Created by Eric Lee on 11/4/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public enum ImageType {
	case mini
	case small
	case middle
	case large
	
	public var size: CGSize {
		switch self {
		case .mini:
			return CGSize(width: 29, height: 60)
		case .small:
			return CGSize(width: 56, height: 114)
		case .middle:
			return CGSize(width: 78, height: 156)
		case .large:
			return CGSize(width: 118, height: 244)
		}
	}
	
	public var querySize: CGSize {
		switch self {
		default:
			return CGSize(width: 78, height: 156)
		}
	}
	
	public var query: String {
		return "w=\(Int(querySize.width))&h=\(Int(querySize.height))"
	}
}
