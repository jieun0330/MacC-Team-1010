//
//  String+.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/14.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public extension String {
	func formattedTimeAgo() -> String? {
		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSS"
		
		if let date = dateFormatter.date(from: self) {
			let now = Date()
			let componentsFormatter = DateComponentsFormatter()
			componentsFormatter.unitsStyle = .full
			componentsFormatter.maximumUnitCount = 1
			
			let timeAgoString: String
			let minuteDifference = Int(now.timeIntervalSince(date) / 60)
			
			if minuteDifference == 0 {
				timeAgoString = "방금 전"
			} else if minuteDifference > 0 && minuteDifference < 60 {
				timeAgoString = "\(minuteDifference)분 전"
			} else if minuteDifference >= 60 && minuteDifference < 1440 {
				let hourDifference = minuteDifference / 60
				timeAgoString = "\(hourDifference)시간 전"
			} else {
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
			
			return timeAgoString
		} else {
			return "유효하지 않은 날짜"
		}
	}
	
	func removeTrailingSpaces() -> String {
		return self.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
	}
	
	func validatePhone(number: String) -> Bool {
		let regex = "^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$"
		return NSPredicate(format: "SELF MATCHES %@", regex)
			.evaluate(with: number)
	}
	
	func birthToYear() -> String {
		guard let firstTwoDigits = Int(self.prefix(2)) else {
			return "000000"
		}

		if firstTwoDigits < 25 {
			return "20" + "\(firstTwoDigits)"
		} else {
			return "19" + "\(firstTwoDigits)"
		}
	}
}
