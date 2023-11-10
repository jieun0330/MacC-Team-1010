//
//  InfoLikeView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/8/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

struct InfoLikeView: View {
	@ObservedObject var viewModel: InformationViewModel
	
	var body: some View {
		HStack(spacing: 16) {
			dislikeButton()
			likeButton()
		}
		.padding(.horizontal, 16)
	}
}

extension InfoLikeView {
	@ViewBuilder
	func likeButton() -> some View {
		Button(action: {
			viewModel.likeButtonTapped()
		}, label: {
			ZStack{
				RoundedRectangle(cornerRadius: 12)
					.frame(height: 50)
					.foregroundColor(viewModel.makHoly.myReaction.likeState == .like ? .GoldenYellow : .W10)
				
				HStack(spacing: 4) {
					Image(systemName: "hand.thumbsup.fill")
						.font(.style(.SF17R))
					Text("좋았어요")
						.SF17R()
				}
				.foregroundColor(viewModel.makHoly.myReaction.likeState == .like ? .white : .W85)
			}
		})
		
	}
	
	func dislikeButton() -> some View {
		Button(action: {
			viewModel.dislikeButtonTapped()
		}, label: {
			ZStack{
				RoundedRectangle(cornerRadius: 12)
					.frame(height: 50)
					.foregroundColor(viewModel.makHoly.myReaction.likeState == .dislike ? .Lilac : .W10)
				
				HStack(spacing: 4) {
					Image(systemName: "hand.thumbsdown.fill")
						.font(.style(.SF17R))
					Text("아쉬워요")
						.SF17R()
				}
				.font(.style(.SF17R))
				.foregroundColor(viewModel.makHoly.myReaction.likeState == .dislike ? .white : .W85)
			}
		})
	}
}
