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
			
			if let data = viewModel.makHoly.myComment?.date {
				footerView(date: data)
			}
			
		}
	}
}

extension InfoMyCommentView {
	@ViewBuilder
	func headerView() -> some View {
		
		HStack {
			Text("내 코멘트")
				.font(.style(.SF12B))
				.foregroundColor(Color(uiColor: .designSystem(.w85)!))
			
			Spacer()
			
			if let myComment = viewModel.makHoly.myComment {
				Button(action: {
					
					viewModel.toggleCommentVisible()
					
				}, label: {
					HStack(spacing: 1) {
						
						Text(myComment.isVisible ? "전체 공개" : "비공개")
						Image(systemName: myComment.isVisible ? "checkmark" : "lock.fill")
						
					}
					.font(.style(.SF12R))
					.foregroundColor(Color(uiColor: .designSystem(.w50)!))
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
			
			let contents = viewModel.makHoly.myComment?.contents ?? "터치해서 코멘트를 남겨보세요!"
			
			Text(contents)
				.font(.style(.SF14R))
				.foregroundColor(Color(uiColor: viewModel.makHoly.myComment != nil ? .designSystem(.white)! : .designSystem(.w85)!))
				.frame(maxWidth: .infinity)
				.multilineTextAlignment(.leading)
				.lineLimit(nil)
				.padding(16)
				.background(
					RoundedRectangle(cornerRadius: 12)
						.foregroundColor(Color(uiColor: .designSystem(.w10)!))
				)
		}
		.disabled(viewModel.makHoly.myComment != nil )
		
		
	}
	
	func footerView(date: String) -> some View {
		
		HStack {
			Text("\(date)")
				.font(.style(.SF12R))
				.foregroundColor(Color(uiColor: .designSystem(.w50)!))
			
			Spacer()
			
			Button(action: {
				viewModel.showActionSheet.toggle()
			}, label: {
				Text("수정")
					.font(.style(.SF12R))
					.foregroundColor(Color(uiColor: .designSystem(.primary)!))
					.padding(.leading, 60)
			})
		}
		.padding(.horizontal, 3)
		
	}
}
