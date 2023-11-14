//
//  InfoMyCommentView.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/4/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

struct InfoMyCommentView: View {
	@ObservedObject var viewModel: InformationViewModel
	
	var body: some View {
		VStack(spacing: 6) {
			
			headerView()
			
			contentView()
			
			if let data = viewModel.myReaction.comment?.date {
				footerView(date: data)
			}
			
		}
		.padding(.horizontal, 16)
	}
}

extension InfoMyCommentView {
	@ViewBuilder
	func headerView() -> some View {
		
		HStack {
			Text("내 코멘트")
				.SF12B()
				.foregroundColor(.W85)
			
			Spacer()
			
			if let myComment = viewModel.myReaction.comment {
				Button(action: {
					
					viewModel.toggleCommentVisible()
					
				}, label: {
					HStack(spacing: 0) {
						
						Text(myComment.isVisible ? "전체 공개" : "비공개")
							.SF12R()
						Image(systemName: myComment.isVisible ? "checkmark" : "lock.fill")
							.font(.style(.SF12R))
						
					}
					.foregroundColor(.W50)
					.padding(.leading, 30)
				})
			}
		}
		.padding(.horizontal, 3)
		
	}
	
	func contentView() -> some View {
		Button {
			
			viewModel.showCommentSheet.toggle()
			
		} label: {
			
			let contents = viewModel.myReaction.comment?.contents ?? "터치해서 코멘트를 남겨보세요!"
			
			Text(contents)
				.font(.style(.SF14R))
				.foregroundColor(Color(uiColor: viewModel.myReaction.comment != nil ? .designSystem(.white)! : .designSystem(.w85)!))
				.frame(maxWidth: .infinity)
				.multilineTextAlignment(.leading)
				.lineLimit(nil)
				.padding(16)
				.background(
					RoundedRectangle(cornerRadius: 12)
						.foregroundColor(Color(uiColor: .designSystem(.w10)!))
				)
		}
		.disabled(viewModel.myReaction.comment != nil)
	}
	
	func footerView(date: String) -> some View {
		HStack {
			Text("\(date)")
				.SF12R()
				.foregroundColor(.W50)
			
			Spacer()
			
			Button(action: {
				viewModel.showActionSheet.toggle()
			}, label: {
				Text("수정")
					.SF12R()
					.foregroundColor(.Primary)
					.padding(.leading, 60)
			})
		}
		.padding(.horizontal, 3)
	}
}
