//
//  ScoreView.swift
//  DesignSystem
//
//  Created by Kim SungHun on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

public enum ScoreType {
	case mini
	case small
	case large
}

public struct ScoreView: View {
	let scoreType: ScoreType
	let scores: [Int]
	let taste = ["단맛", "신맛", "걸쭉", "탄산"]
	let padding: Double
	
	public init(scoreType: ScoreType, scores: [Int], padding: Double = 0.0) {
		self.scoreType = scoreType
		self.scores = scores
		self.padding = padding
	}
	
	public var body: some View {
		HStack(spacing: padding) {
			ForEach(0..<scores.count, id: \.self) { index in
				VStack {
					Image(uiImage: getImage(for: scoreType, score: scores[index]))
					Text(taste[index]).font(.style(.SF10B))
				}
			}
		}
	}
	
	private func getImage(for type: ScoreType, score: Int) -> UIImage {
		switch type {
		case .mini:
			switch score {
			case 0:
				return .designSystem(.scoremini0)!
			case 1:
				return .designSystem(.scoremini1)!
			case 2:
				return .designSystem(.scoremini2)!
			case 3:
				return .designSystem(.scoremini3)!
			case 4:
				return .designSystem(.scoremini4)!
			case 5:
				return .designSystem(.scoremini5)!
			default:
				return UIImage()
			}
		case .small:
			switch score {
			case 0:
				return .designSystem(.scoresmall0)!
			case 1:
				return .designSystem(.scoresmall1)!
			case 2:
				return .designSystem(.scoresmall2)!
			case 3:
				return .designSystem(.scoresmall3)!
			case 4:
				return .designSystem(.scoresmall4)!
			case 5:
				return .designSystem(.scoresmall5)!
			default:
				return UIImage()
			}
		case .large:
			switch score {
			case 0:
				return .designSystem(.scorelarge0)!
			case 1:
				return .designSystem(.scorelarge1)!
			case 2:
				return .designSystem(.scorelarge2)!
			case 3:
				return .designSystem(.scorelarge3)!
			case 4:
				return .designSystem(.scorelarge4)!
			case 5:
				return .designSystem(.scorelarge5)!
			default:
				return UIImage()
			}
		}
	}
}
