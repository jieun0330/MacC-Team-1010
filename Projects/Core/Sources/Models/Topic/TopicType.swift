//
//  TopicType.swift
//  Core
//
//  Created by Kim SungHun on 12/2/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import UIKit
import DesignSystem
import SwiftUI

public enum TopicType: String, CaseIterable, Hashable {
	case koreaAward2023
	case pohang
	
	public var description: String {
		switch self {
		case .koreaAward2023:
			return "2023\n대한민국\n주류대상"
		case .pohang:
			return "포항\n막걸리"
		}
	}
	
	public var topicColor: LinearGradient {
		switch self {
		case .koreaAward2023:
			return LinearGradient(
				stops: [
					Gradient.Stop(color: Color(red: 0.86, green: 0.76, blue: 0.76), location: 0.00),
					Gradient.Stop(color: Color(red: 0.64, green: 0.53, blue: 0.53), location: 1.00),
				],startPoint: UnitPoint(x: 0.5, y: 0),
				endPoint: UnitPoint(x: 0.5, y: 1)
			)
		case .pohang:
			return LinearGradient(
				stops: [
					Gradient.Stop(color: Color(red: 0.45, green: 0.63, blue: 0.84), location: 0.00),
					Gradient.Stop(color: Color(red: 0.24, green: 0.43, blue: 0.66), location: 1.00),
				],startPoint: UnitPoint(x: 0.5, y: 0),
				endPoint: UnitPoint(x: 0.5, y: 1)
			)
		}
	}
	
	public var topicImage: UIImage {
		switch self {
		case .koreaAward2023:
			return .designSystem(.koreaAward)!
		case .pohang:
			return .designSystem(.pohang)!
		}
	}
}
