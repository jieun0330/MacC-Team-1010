//
//  String+.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/14.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public extension String {
	func extractDateFromISOString() -> String? {
		let components = self.components(separatedBy: "T")
		guard let dateString = components.first else {
			return nil
		}
		let dateComponents = dateString.components(separatedBy: "-")
		guard dateComponents.count == 3,
			  let year = dateComponents.first,
			  let month = dateComponents.dropFirst().first,
			  let day = dateComponents.dropFirst(2).first else {
			return nil
		}
		return "\(year)년 \(month)월 \(day)일"
	}
	
	func removeTrailingSpaces() -> String {
		return self.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
	}
}
