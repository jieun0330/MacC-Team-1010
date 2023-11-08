//
//  InfoReactionsView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/7/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import DesignSystem
import Core

struct InfoReactionsView: View {
	@ObservedObject var viewModel: InformationViewModel
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			
			Spacer()
				.frame(width: 16)
			
			if viewModel.comments.count == 0 {
				noReactionSingleView()
			} else {
				HStack(spacing: 16) {
					ForEach(viewModel.comments) { comment in
						reactionSingleView(comment: comment)
					}
				}
			}
		}
		.scrollDisabled(viewModel.comments.count < 2)
    }
}


extension InfoReactionsView {
	@ViewBuilder
	func reactionSingleView(comment: VisibleComment) -> some View {
		VStack(alignment: .leading, spacing: 10) {
			
			// 상단 유저 이름 & 평가 아이콘
			HStack(alignment: .center, spacing: 4) {
				
				if let isLiked = comment.isLiked {
					Image(uiImage: isLiked ? .designSystem(.like)! : .designSystem(.sorry)!)
						.resizable()
						.scaledToFit()
						.frame(width: 10, height: 10)
				}
				
				Text(comment.userName)
					.font(.style(.SF14R))
					.foregroundColor(.W50)
				
				Spacer()
			}
			
			// 리뷰 내용
			// TODO: - 코멘트 5줄 미만인 경우 Alignment 오류
			Text(comment.content)
				.SF14R()
				.foregroundColor(.W85)
				.frame(maxWidth: .infinity, alignment: .leading)
				.fixedSize(horizontal: false, vertical: false)
				.multilineTextAlignment(.leading)
				.lineLimit(5)
				.frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
			
			// 리뷰 작성 날짜
			HStack {
				Text(comment.date)
					.SF14R()
					.foregroundColor(.W50)
				
				Spacer()
				
			}
		}
		.frame(width: 183)
		.padding(16)
		.background(
			RoundedRectangle(cornerRadius: 15)
				.foregroundColor(Color(uiColor: .designSystem(.darkgrey)!))
		)
	}
	
	func noReactionSingleView() -> some View {
		VStack{
			Spacer()
			Text("아직 코멘트가 없어요\n첫번째 코멘트를 남겨보세요")
				.SF12R()
				.foregroundColor(.W50)
				.multilineTextAlignment(.center)
			Spacer()
		}
		.frame(width: 180, height: 160)
		.padding(16)
		.background(
			RoundedRectangle(cornerRadius: 15)
				.foregroundColor(Color(uiColor: .designSystem(.darkgrey)!))
		)
	}
	
}
