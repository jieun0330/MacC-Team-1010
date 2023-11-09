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
	
	let makHolyId: Int
	
	init(makHolyId: Int) {
		self.makHolyId = makHolyId
	}
	
	@Published var isFetchCompleted: Bool = false
	@Published var makHoly: MakHoly = MakHoly()
	@Published var likeDetail: LikeDetail = LikeDetail()
	@Published var comments: [VisibleComment] = []
	
	@Published var showActionSheet: Bool = false
	@Published var showCommentSheet: Bool = false
	
	private var user: User = User.user1
	
	// detail api
	func fetchMakHoly() {
		
	}
	
	// makLikesAndComments  api
	func fetchReactions() {
		
		self.likeDetail = LikeDetail(totalCount: 10, likeCount: 5, dislikeCount: 5)
		
		self.comments.append(VisibleComment(userName: "유저-1", isLiked: true, content: "맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요맛있어요", date: "2023-11-04"))
		self.comments.append(VisibleComment(userName: "유저-2", isLiked: false, content: "맛없어", date: "2023-11-05"))
		self.comments.append(VisibleComment(userName: "유저-3", isLiked: nil, content: "한번쯤은..", date: "2023-11-06"))
		
	}
	
	// Comment Visibe 변경
	func toggleCommentVisible() {
		
		self.makHoly.myComment?.isVisible.toggle()
		
		// Comment Visible 업데이트 API 연결
	}
	
	func likeButtonTapped() {
		
		switch self.makHoly.likeState {
		case .like:
			self.makHoly.likeState = .none
		default:
			self.makHoly.likeState = .like
		}
		
	}
	
	func dislikeButtonTapped() {
		
		switch self.makHoly.likeState {
		case .dislike:
			self.makHoly.likeState = .none
		default:
			self.makHoly.likeState = .dislike
		}
		
	}
	
}


