//
//  Award.swift
//  Core
//
//  Created by Eric Lee on 11/1/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct Award: Identifiable, Hashable {
	public var id = UUID()
	public let year: Int
	public let name: String
	public let type: String
	
	public init(_  input: String) {
		let components = input.components(separatedBy: " ")
		if components.count >= 4 {
			let yearString = components[0]
			self.year = Int(yearString) ?? 0
			self.name = components[1] + " " 	+ components[2]
			self.type = components[3]
			
		} else {
			self.year = 0
			self.name = ""
			self.type = ""
		}
	}
}
