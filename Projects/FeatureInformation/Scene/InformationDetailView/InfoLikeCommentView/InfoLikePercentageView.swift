//
//  InfoLikePercentageView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/8/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

struct InfoLikePercentageView: View {
	let likeDetail: LikeDetail
	
    var body: some View {
		VStack(spacing: 5) {
			percentageView()
			descriptionView()
		}
		.padding(.horizontal, 16)
    }
}

extension InfoLikePercentageView {
	@ViewBuilder
	func percentageView() -> some View {
		HStack(spacing: 12) {
			
			Text(likeDetail.likeText)
			
			if likeDetail.isEnough {
				RoundedRectangle(cornerRadius: 11)
					.fill(
						LinearGradient(
							stops: [
								Gradient.Stop(color: .SunriseTop, location: 0.00),
								Gradient.Stop(color: .SunriseBottom, location: 1.00),
							],
							startPoint: UnitPoint(x: CGFloat(likeDetail.likePercent)/100.0 - 0.02, y: 1),
							endPoint: UnitPoint(x: CGFloat(likeDetail.likePercent)/100.0 + 0.02, y: 1)
						)
					)
					.frame(height: 5)
			} else {
				RoundedRectangle(cornerRadius: 11)
					.fill(Color.W10)
					.frame(height: 5)
			}
			
			Text(likeDetail.dislikeText)
		}
	}
	
	func descriptionView() -> some View {
		HStack {
			if likeDetail.isEnough {
				Text("좋았어요")
					.SF14R()
					.foregroundColor(.W50)
				Spacer()
				Text("아쉬워요")
					.SF14R()
					.foregroundColor(.W50)
			}
			else {
				Spacer()
				Text("평가가 10개 이상 모이면 그래프를 볼 수 있어요!")
					.SF14R()
					.foregroundColor(.W50)
				Spacer()
			}
		}
	}
	
}
