//
//  ScoreView.swift
//  DesignSystem
//
//  Created by Kim SungHun on 2023/10/31.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem

public enum TasteScoreViewType {
	case mini
	case large
}

private struct TasteScoreViewStyle {
	var outerSpacing: Double
	var innerSpacing: Double
	var font: TENTENFont
	var color: TENTENColor
	
	init(scoreType: TasteScoreViewType) {
		switch scoreType {
		case .mini:
			outerSpacing = 6.0
			innerSpacing = 4.0
			font = .SF10B
			color = .w50
		case .large:
			outerSpacing = 20.0
			innerSpacing = 6.0
			font = .SF12B
			color = .w50
		}
	}
}

public struct TasteScoreView: View {
	
	let type: TasteScoreViewType
	private let style: TasteScoreViewStyle
	
	let sweetness: Int // 단맛 점수
	let sourness: Int // 신맛 점수
	let thickness: Int // 걸쭉 점수
	let freshness: Int // 청량 점수
	
	public init(
		type: TasteScoreViewType,
		sweetness: Int,
		sourness: Int,
		thickness: Int, freshness: Int) {
		self.type = type
		self.style = TasteScoreViewStyle(scoreType: type)
		self.sweetness = sweetness
		self.sourness = sourness
		self.thickness = thickness
		self.freshness = freshness
	}
	
	public init(
		type: TasteScoreViewType,
		makHoly: MakHoly) {
			self.type = type
			self.style = TasteScoreViewStyle(scoreType: type)
			self.sweetness = makHoly.sweetness
			self.sourness = makHoly.sourness
			self.thickness = makHoly.thickness
			self.freshness = makHoly.freshness
		}
	
	public var body: some View {
		HStack(spacing: self.style.outerSpacing) {
			scoreSingleView(description: "단맛", score: sweetness)
			scoreSingleView(description: "신맛", score: sourness)
			scoreSingleView(description: "걸쭉", score: thickness)
			scoreSingleView(description: "탄산", score: freshness)
		}
	}
}

extension TasteScoreView {
	@ViewBuilder
	func scoreSingleView(description: String, score: Int) -> some View {
		VStack(spacing: self.style.innerSpacing) {
			Image(uiImage: getImage(for: self.type, score: score))
			Text(description)
				.font(.style(self.style.font))
				.foregroundColor(Color(uiColor: .designSystem(self.style.color)!))
		}
	}
	
	private func getImage(for type: TasteScoreViewType, score: Int) -> UIImage {
		switch type {
		case .mini:
			switch score {
			case 0:
				return .designSystem(.scoreMini0)!
			case 1:
				return .designSystem(.scoreMini1)!
			case 2:
				return .designSystem(.scoreMini2)!
			case 3:
				return .designSystem(.scoreMini3)!
			case 4:
				return .designSystem(.scoreMini4)!
			case 5:
				return .designSystem(.scoreMini5)!
			default:
				return .designSystem(.scoreMiniNull)!
			}
		case .large:
			switch score {
			case 0:
				return .designSystem(.scoreLarge0)!
			case 1:
				return .designSystem(.scoreLarge1)!
			case 2:
				return .designSystem(.scoreLarge2)!
			case 3:
				return .designSystem(.scoreLarge3)!
			case 4:
				return .designSystem(.scoreLarge4)!
			case 5:
				return .designSystem(.scoreLarge5)!
			default:
				return .designSystem(.scoreLargeNull)!
			}
		}
	}
}
