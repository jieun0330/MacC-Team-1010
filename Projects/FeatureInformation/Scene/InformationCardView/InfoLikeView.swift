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
		.alert(isPresented: $viewModel.errorState) {
			Alert(title: Text("네트워크 에러"), message: Text("인터넷 연결상태를 확인해주세요."),
				  dismissButton: .default(Text("확인")))
		}
	}
}

extension InfoLikeView {
	@ViewBuilder
	func likeButton() -> some View {
		Button(action: {
			viewModel.likeButtonTapped()
			viewModel.postLikeState(from: .like)
		}, label: {
			ZStack{
				RoundedRectangle(cornerRadius: 12)
					.frame(height: 50)
					.foregroundColor(viewModel.myReaction.likeState == .like ? .GoldenYellow : .W10)
				
				HStack(spacing: 4) {
					Image(systemName: "hand.thumbsup.fill")
						.font(.style(.SF17R))
					Text("좋았어요")
						.SF17R()
				}
				.foregroundColor(viewModel.myReaction.likeState == .like ? .white : .W85)
			}
		})
		
	}
	
	func dislikeButton() -> some View {
		Button(action: {
			viewModel.dislikeButtonTapped()
			viewModel.postLikeState(from: .dislike)
		}, label: {
			ZStack{
				RoundedRectangle(cornerRadius: 12)
					.frame(height: 50)
					.foregroundColor(viewModel.myReaction.likeState == .dislike ? .Lilac : .W10)
				
				HStack(spacing: 4) {
					Image(systemName: "hand.thumbsdown.fill")
						.font(.style(.SF17R))
					Text("아쉬워요")
						.SF17R()
				}
				.foregroundColor(viewModel.myReaction.likeState == .dislike ? .white : .W85)
			}
		})
	}
}
