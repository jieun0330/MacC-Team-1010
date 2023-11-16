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
	
	var isCommented: Bool {
		return viewModel.myReaction.comment != nil
	}
	
	var body: some View {
		if let comment = viewModel.myReaction.comment {
			commentedView(comment: comment)
				.alert(isPresented: $viewModel.errorState) {
					Alert(title: Text("네트워크 에러"), message: Text("인터넷 연결상태를 확인해주세요."),
						  dismissButton: .default(Text("확인")))
				}
		} else {
			noCommentedView()
				.alert(isPresented: $viewModel.errorState) {
					Alert(title: Text("네트워크 에러"), message: Text("인터넷 연결상태를 확인해주세요."),
						  dismissButton: .default(Text("확인")))
				}
		}
	}
}

extension InfoMyCommentView {
	@ViewBuilder
	func noCommentedView() -> some View {
		VStack(spacing: 6) {
			HStack {
				Text("내 코멘트")
					.SF12B()
					.foregroundColor(.W85)
				
				Spacer()
			}
			.padding(.horizontal, 3)
			
			Button {
				viewModel.showCommentSheet.toggle()
			} label: {
				Text("터치해서 코멘트를 남겨보세요!")
					.SF14R()
					.foregroundColor(.W85)
					.frame(maxWidth: .infinity)
					.lineLimit(1)
					.padding(16)
					.background(
						RoundedRectangle(cornerRadius: 12)
							.foregroundColor(Color(uiColor: .designSystem(.w10)!))
					)
			}
		}
		.padding(.horizontal, 16)
	}
	
	@ViewBuilder
	func commentedView(comment: MyComment) -> some View {
		VStack(spacing: 6) {
			headerView(isVisible: comment.isVisible)
			
			Text(comment.contents)
				.SF14R()
				.foregroundColor(.White)
				.frame(maxWidth: .infinity, alignment: .topLeading)
				.fixedSize(horizontal: false, vertical: true)
				.multilineTextAlignment(.leading)
				.lineLimit(nil)
				.padding(16)
				.background(
					RoundedRectangle(cornerRadius: 12)
						.foregroundColor(Color(uiColor: .designSystem(.w10)!))
				)
			
			
			footerView(date: comment.date)
			
		}
		.padding(.horizontal, 16)
	}
	
	@ViewBuilder
	func headerView(isVisible: Bool) -> some View {
		
		HStack {
			Text("내 코멘트")
				.SF12B()
				.foregroundColor(.W85)
			
			Spacer()
			
			
			Button(action: {
				
				viewModel.toggleCommentVisible()
				viewModel.fetchReactions()
				
			}, label: {
				HStack(spacing: 0) {
					
					Text(isVisible ? "전체 공개" : "비공개")
						.SF12R()
					Image(systemName: isVisible ? "checkmark" : "lock.fill")
						.font(.style(.SF12R))
					
				}
				.foregroundColor(.W50)
				.padding(.leading, 30)
			})
			
		}
		.padding(.horizontal, 3)
	}
	
	@ViewBuilder
	func footerView(date: String) -> some View {
		HStack {
			Text("\(date.extractDateFromISOString() ?? "")")
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
