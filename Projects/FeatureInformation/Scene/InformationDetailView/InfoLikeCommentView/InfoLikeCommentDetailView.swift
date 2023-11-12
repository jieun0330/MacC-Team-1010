//
//  InfoLikeCommentDetailView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/10/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

struct InfoLikeCommentDetailView: View {
	@Binding public var isPresented: Bool
	
	let comments: [VisibleComment] = [
		VisibleComment(userName: "나", isLiked: .like, content: "와 즁말 맛있다", date: "10월 28일"),
		VisibleComment(userName: "너", isLiked: .dislike, content: "와 좀 길게 작성하고 싶은데 냉탕에 상어가 살거라 믿었어", date: "10월 28일"),
		VisibleComment(userName: "이이이이이이이이름", isLiked: .dislike, content: "와 좀 길게 작성하고 싶은데 냉탕에 상어가 살거라 믿었어 와 좀 길게 작성하고 싶은데 냉탕에 상어가 살거라 믿었어 와 좀 길게 작성하고 싶은데 냉탕에 상어가 살거라 믿었어 와 좀 길게 작성하고 싶은데 냉탕에 상어가 살거라 믿었어 와 좀 길게 작성하고 싶은데 냉탕에 상어가 살거라 믿었어 와 좀 길게 작성하고 싶은데 냉탕에 상어가 살거라 믿었어", date: "10월 28일")
	]
	let makHolyName: String
    var body: some View {
		VStack {
			// Header
			headerView()
				.padding(.top, 15)
			// 내용 ListView
			ScrollView(showsIndicators: false) {
				VStack(spacing: 0) {
					HStack {
						Text("\(comments.count)개의 코멘트가 있어요")
						Spacer()
					}
					ForEach(comments) { comment in
						reactionSingleView(comment: comment)
					}
				}
				.padding(.horizontal, 16)
			}
			
		}
    }
}

extension InfoLikeCommentDetailView {
	@ViewBuilder
	func headerView() -> some View {
		VStack(spacing: 0) {
			HStack(alignment: .center) {
				
				Button {
					isPresented = false
				} label: {
					Text("취소")
						.SF17R()
						.foregroundColor(.Primary)
				}
				
				Spacer()
				
				Text("평가 및 코멘트")
					.SF17B()
					.foregroundColor(.White)
				
				Spacer()
				
				Button {
				
				} label: {
					Text("취소")
						.SF17R()
						.foregroundColor(.Primary)
				}
				.opacity(0)
				
			}
			.padding(.vertical, 8)
			.padding(.horizontal, 16)
			DividerView()
		}
	}
	
	@ViewBuilder
	func reactionSingleView(comment: VisibleComment) -> some View {
		VStack(alignment: .leading, spacing: 10) {
			
			// 상단 유저 이름 & 평가 아이콘
			HStack(alignment: .center, spacing: 0) {
				
				Text(makHolyName)
					.SF14R()
					.foregroundColor(.White)
					.padding(.trailing, 4)
				
				if comment.isLiked != .none {
					Image(uiImage: (comment.isLiked == .like) ? .designSystem(.like)! : .designSystem(.sorry)!)
						.resizable()
						.scaledToFit()
						.frame(width: 10, height: 10)
				}
				
				
				Spacer()
				
				Text(makHolyName)
					.SF14R()
					.foregroundColor(.W25)
			}
			
			// 리뷰 내용
			Text(comment.content)
				.SF14R()
				.foregroundColor(.W85)
				.frame(maxWidth: .infinity, alignment: .leading)
			
			// 리뷰 작성 날짜
			HStack {
				Text(comment.date)
					.SF14R()
					.foregroundColor(.W50)
				
				Spacer()
				
			}
		}
		.frame(width: UIScreen.main.bounds.width - 32)
		.padding(.vertical, 10)
		
	}

}
