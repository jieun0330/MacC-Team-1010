//
//  CommentEditSheet.swift
//  Core
//
//  Created by Eric Lee on 11/10/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI

public struct CommentEditSheet: View {
	
	@Binding public var isPresented: Bool
	
	@State public var comment: MyComment
	
	var state: CommentEditState
	
	public typealias saveHandler = (MyComment) -> Void
	public var saveCompletion: saveHandler
	@State private var keyboardHeight: CGFloat = 0
	
	var isValid: Bool {
		return !comment.contents.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
	}
	
	public init(
		state: CommentEditState,
		isPresented: Binding<Bool>,
		comment: MyComment,
		saveCompletion: @escaping saveHandler) {
			self.state = state
			self._isPresented = isPresented
			self.comment = comment
			self.saveCompletion = saveCompletion
		}
	
	public var body: some View {
		VStack(spacing: 0) {
			headerView()
				.padding(.top, 15)
		
			TextField("",  text: $comment.contents, axis: .vertical)
				.placeholder(when: comment.contents.isEmpty) {
					Text("막걸리에 대한 생각을 자유롭게 적어주세요.")
						.font(.style(.SF17R))
						.foregroundColor(.W25)
				}
				.frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300, alignment: .topLeading)
				.font(.style(.SF17R))
				.foregroundColor(.W85)
				.padding(16)
			
			footerView()
				.padding(.bottom, keyboardHeight)
			
			Spacer()
		}
	}
}

extension CommentEditSheet {
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
				
				switch state {
				case .insert:
					Text("코멘트 남기기")
						.SF17B()
						.foregroundColor(.White)
				case .update:
					Text("코멘트 수정")
						.SF17B()
						.foregroundColor(.White)
				}
				
				Spacer()
				
				Button {
					saveCompletion(comment)
					isPresented = false
				} label: {
					Text("저장")
						.SF17B()
						.foregroundColor(isValid ? .Primary : .W50)
				}
				.disabled(comment.contents.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
				
			}
			.padding(.vertical, 11)
			.padding(.horizontal, 16)
			DividerView()
		}
	}
	
	func footerView() -> some View {
		VStack(spacing: 16) {
			DividerView()
			HStack(spacing: 0) {
				Spacer()
				Text("비공개")
					.SF14R()
					.foregroundColor(.W50)
				Button(action: {
					comment.isVisible.toggle()
				}, label: {
					Image(uiImage: comment.isVisible ? .designSystem(.visibleTrue)! : .designSystem(.visibleFalse)!)
						.resizable()
						.scaledToFit()
						.frame(width: 24, height: 22)
				})
			}
			.padding(.horizontal, 16)
		}
	}
	
}
