//
//  ContentView.swift
//  FeatureInformation
//
//  Created by 박지은 on 2023/10/20.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core
import DesignSystem

public struct InformationView: View {
	
	@StateObject var viewModel: InformationViewModel
	
	public init(makHolyId: Int) {
		self._viewModel = StateObject(wrappedValue: InformationViewModel(makHolyId: makHolyId, maHolyRepo: DefaultMakgeolliRepository(), userRepo: DefaultUserRepository()))
	}
	
	public var body: some View {
		
		ScrollView(.vertical, showsIndicators: false) {
			VStack(spacing: 0) {
				InformationCardView(viewModel: viewModel)
				InformationDetailView(viewModel: viewModel)
			}
		}
		.navigationBarTitleDisplayMode(.inline)
		.navigationBarBackButtonHidden(true)
		.toolbar{
			ToolbarItem(placement: .navigationBarLeading) {
				InfoBackButton()
			}
			ToolbarItem(placement: .navigationBarTrailing) {
				InfoBookMarkButton(viewModel: viewModel)
			}
		}
		.onAppear(perform: {
			viewModel.fetchDatas()
		})
		//코멘트 상세 Modal 화면
		.sheet(isPresented: $viewModel.showDetailCommentListSheet, content: {
			InfoLikeCommentDetailView(isPresented: $viewModel.showDetailCommentListSheet, comments: viewModel.comments, makHolyName: viewModel.makHoly.name)
		})
		// 코멘트 수정 ActionSheet
		.confirmationDialog("", isPresented: $viewModel.showActionSheet) {
			Button {
				viewModel.showActionSheet.toggle()
				viewModel.showCommentSheet.toggle()
			} label: {
				Text("수정하기")
					.SF17R()
					.foregroundColor(.Primary)
			}
			
			Button {
				viewModel.showActionSheet = false
				viewModel.showDeleteAlert = true
			} label: {
				Text("삭제하기")
					.SF17R()
					.foregroundColor(.Alert)
			}
			
			Button(role: .cancel) {
				print("취소하기")
			} label: {
				Text("취소하기")
					.SF17R()
					.foregroundColor(.Primary)
			}
			
		}
		//코멘트 작성 Modal Sheet
		.sheet(isPresented: $viewModel.showCommentSheet, content: {
			if let comment = viewModel.myReaction.comment {
				// 코멘트 수정
				CommentEditSheet(
					state: .update,
					isPresented: $viewModel.showCommentSheet,
					comment: comment, 
					saveCompletion: { myComment in
					viewModel.updateComment(myComment: myComment)
				})
			} else {
				// 코멘트 추가
				CommentEditSheet(
					state: .insert,
					isPresented: $viewModel.showCommentSheet,
					comment: MyComment(),
					saveCompletion: { myComment in
					viewModel.insertComment(myComment: myComment)
				})
			}
			
		})
		.alert(isPresented: $viewModel.showDeleteAlert) {
			Alert(title: Text("코멘트 삭제"), message: Text("코멘트를 삭제하시겠어요?"),
				  primaryButton: .cancel(
					Text("취소"),
					action: {}
				  ), secondaryButton: .default(
					Text("삭제하기"),
					action: {
						viewModel.deleteComment()
					}
				  ))
		}
		
		
	}
}


