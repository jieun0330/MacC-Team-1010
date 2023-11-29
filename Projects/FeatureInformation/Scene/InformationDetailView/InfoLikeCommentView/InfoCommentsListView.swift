//
//  InfoCommentsListView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/8/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

struct InfoCommentsListView: View {
	@ObservedObject var viewModel: InformationViewModel
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			
			if viewModel.comments.isEmpty {
				noReactionSingleView()
					.padding(.leading, 16)
			} else {
				HStack(spacing: 16) {
					
					Rectangle()
						.frame(width: 0, height: 0)
					
					ForEach(viewModel.comments) { comment in
						reactionSingleView(comment: comment)
							.onAppear {
								if comment == viewModel.comments.last {
									if !viewModel.isLastPage {
										var offset = viewModel.currentOffset
										offset += 1
										withAnimation {
											viewModel.fetchReactions(offset: offset)
										}
									}
								}
							}
					}
				}
			}
		}
		.scrollDisabled(viewModel.comments.count < 2)
	}
}

extension InfoCommentsListView {
	@ViewBuilder
	func reactionSingleView(comment: VisibleComment) -> some View {
		VStack(alignment: .leading, spacing: 10) {
			
			// 상단 유저 이름 & 평가 아이콘
			HStack(alignment: .center, spacing: 4) {
				
				if comment.isLiked != .none {
					Image(uiImage: (comment.isLiked == .like) ? .designSystem(.like)! : .designSystem(.sorry)!)
						.resizable()
						.scaledToFit()
						.frame(width: 10, height: 10)
				}
				
				Text(comment.userName)
					.SF14R()
					.foregroundColor(.W50)
				
				Spacer()
			}
			
			// 리뷰 내용
			Text(comment.content)
				.SF14R()
				.foregroundColor(.W85)
				.frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100, alignment: .topLeading)
				.multilineTextAlignment(.leading)
				.lineLimit(5)
			
			// 리뷰 작성 날짜
			HStack {
				Text(comment.date.formattedTimeAgo() ?? "")
					.SF14R()
					.foregroundColor(.W50)
				
				Spacer()
				
			}
		}
		.frame(width: 183)
		.padding(16)
		.background(
			RoundedRectangle(cornerRadius: 15)
				.foregroundColor(.DarkGrey)
		)
	}
	
	func noReactionSingleView() -> some View {
		VStack{
			Spacer()
			Text("아직 공개된 코멘트가 없어요")
				.SF12R()
				.foregroundColor(.W50)
				.multilineTextAlignment(.center)
			Spacer()
		}
		.frame(width: 180, height: 160)
		.padding(16)
		.background(
			RoundedRectangle(cornerRadius: 15)
				.foregroundColor(.DarkGrey)
		)
	}
	
}
