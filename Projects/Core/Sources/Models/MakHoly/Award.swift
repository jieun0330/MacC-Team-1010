//
//  Award.swift
//  Core
//
//  Created by Eric Lee on 11/1/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct Award {
	
	public let year: Int
	public let name: String
	public let type: String
	
	public init(year: Int, name: String, type: String) {
		self.year = year
		self.name = name
		self.type = type
	}
	
}

