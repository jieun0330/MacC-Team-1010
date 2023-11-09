//
//  Double+.swift
//  Core
//
//  Created by Eric Lee on 11/2/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

extension Double {
	public func formattedAdv() -> String {
		let intValue = Int(self)
		let decimalPart = self - Double(intValue)
		
		if decimalPart == 0.0 {
			return String(intValue)
		} else {
			return String(format: "%.1f", self)
		}
	}
}
