//
//  Int+.swift
//  Core
//
//  Created by Eric Lee on 11/2/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

extension Int {
	
	public func formattedVolume() -> String {
		return String(self) + "ml"
	}
	
	public func formattedPrice() -> String {
		return String(self) + "원"
	}
	
}
