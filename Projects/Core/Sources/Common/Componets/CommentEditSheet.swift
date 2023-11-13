//
//  CommentEditSheet.swift
//  Core
//
//  Created by Eric Lee on 11/10/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
public enum CommentEditState {
	case insert
	case update
}

public struct CommentEditSheet: View {
	
	@Binding public var isPresented: Bool
	
	@State public var comment: MyComment
	
	var state: CommentEditState
	
	public typealias saveHandler = (MyComment) -> Void
	public var saveCompletion: saveHandler
	@State private var keyboardHeight: CGFloat = 0
	
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
			ZStack {
				VStack {
					headerView()
						.padding(.top, 15)
					TextField("막걸리에 대한 생각을 자유롭게 적어주세요.",  text: $comment.contents)
							.font(.style(.SF17R))
							.foregroundColor(.W25)
							.padding(.horizontal, 16)
							.frame(minHeight: 0, maxHeight: .infinity)
					Spacer()
				}
				
				VStack {
					Spacer()
					footerView()
						.padding(.bottom, keyboardHeight)
				}
			}
		}
		.onAppear {
			
			NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
				if let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
					keyboardHeight = keyboardSize.height
				}
			}
			
			NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
				keyboardHeight = 0
			}
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
						.foregroundColor(.Primary)
				}
				
			}
			.padding(.vertical, 11)
			.padding(.horizontal, 16)
			DividerView()
		}
	}
	
	func footerView() -> some View {
		VStack(spacing: 0) {
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
