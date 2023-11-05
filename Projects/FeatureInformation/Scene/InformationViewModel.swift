//
//  InformationViewModel.swift
//  FeatureInformation
//
//  Created by Eric Lee on 11/4/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import SwiftUI
import Core

final class InformationViewModel: ObservableObject {
	
	@Published var makHoly: MakHoly
	
	init(makHoly: MakHoly) {
		self.makHoly = makHoly
	}
	
	@Published var showActionSheet: Bool = false
	@Published var showCommentSheet: Bool = false
	@Published var myComment: Comment? = nil
	@Published var isBookmarked: Bool = false
	@Published var likeState: Bool? = nil
	
	@Published var comments: [Comment] = []
	
	private var user: User = User.user1
	
	func fetchDatas() {
		self.fetchUserInfo()
		self.fetchComments()
		self.setMyReactions()
	}
	
	// 내 정보 가져오기
	func fetchUserInfo() {
		self.user = User.user1
	}
	
	// Comment Id 들로 Comments 가져오기
	func fetchComments() {
		for commentId in self.makHoly.commentIds {
			print(commentId)
			if let comment = Comment.mockDatas.first(where: { $0.id == commentId }) {
				print(comment)
				self.comments.append(comment)
				print("----")
				print(self.comments)
				print("----")
			}
		}
		print(self.comments)
	}
	
	// 내 반응 정보 세팅
	func setMyReactions() {
		
		// 나의 북마크 여부
		if user.bookmarks.contains(makHoly.id) {
			self.isBookmarked = true
		}
		
		// 나의 평가 내용
		if user.likes.contains(makHoly.id) {
			self.likeState = true
		} else if user.dislikes.contains(makHoly.id) {
			self.likeState = false
		}
		
		// 나의 코멘트 내용 초기화 & Comments에서 내꺼 제거
		if let index = comments.firstIndex(where: { $0.userId == user.id }) {
			myComment = comments[index]
			comments.remove(at: index)
		}
		
	}

	
	
	
}


