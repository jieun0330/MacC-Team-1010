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
	
	let makHolyMini: MakHolyMini

	init(makHolyMini: MakHolyMini) {
		self.makHolyMini = makHolyMini
	}
	
	@Published var makHoly: MakHoly? = nil
	@Published var likeDetail: LikeDetail? = nil
	@Published var comments: [VisibleComment] = []
	
	@Published var showActionSheet: Bool = false
	@Published var showCommentSheet: Bool = false
	
	private var user: User = User.user1
	
	// detail api
	func fetchMakHoly() {
		self.makHoly = MakHoly.test1
	}
	
	// makLikesAndComments  api
	func fetchReactions() {
		
		self.likeDetail = LikeDetail(totalCount: 10, likeCount: 5, dislikeCount: 5)
		
		self.comments.append(VisibleComment(userName: "유저-1", isLiked: .like, content: "맛있어요", date: "2023-11-04"))
		self.comments.append(VisibleComment(userName: "유저-2", isLiked: .like, content: "맛없어", date: "2023-11-05"))
		self.comments.append(VisibleComment(userName: "유저-3", isLiked: .none, content: "한번쯤은..", date: "2023-11-06"))
		
	}
	
	
	
}


