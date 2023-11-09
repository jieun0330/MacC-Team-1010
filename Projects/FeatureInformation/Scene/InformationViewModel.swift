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
	let maHolyRepo: DefaultMakgeolliRepository
	
	init(makHolyId: Int, maHolyRepo: DefaultMakgeolliRepository) {
		self.makHolyId = makHolyId
		self.maHolyRepo = maHolyRepo
	}
	
	@Published var isFetchCompleted: Bool = false
	@Published var makHoly: MakHoly = MakHoly()
	@Published var likeDetail: LikeDetail = LikeDetail()
	@Published var comments: [VisibleComment] = []
	
	@Published var showActionSheet: Bool = false
	@Published var showCommentSheet: Bool = false
	
	private var user: User = User.user1
	
	// detail api
	@MainActor
	func fetchMakHoly() {
		Task {
			
			do {
				let makHoly = try await maHolyRepo.fetchDetail(makNumber: 5, userId: 1)
				self.makHoly = makHoly
				print("fetchMakHoly Completed : ------- \n \(makHoly) \n -------")
				self.isFetchCompleted = true
			} catch {
				Logger.debug(error: error, message: "")
			}
			
		}
	}
	
	// makLikesAndComments  api
	func fetchReactions() {
				
	}
	
	// Comment Visibe 변경
	func toggleCommentVisible() {
		
		self.makHoly.myReaction.comment?.isVisible.toggle()
		
		// Comment Visible 업데이트 API 연결
	}
	
	func likeButtonTapped() {
		
		switch self.makHoly.myReaction.likeState {
		case .like:
			self.makHoly.myReaction.likeState = .none
		default:
			self.makHoly.myReaction.likeState = .like
		}
		
	}
	
	func dislikeButtonTapped() {
		
		switch self.makHoly.myReaction.likeState {
		case .dislike:
			self.makHoly.myReaction.likeState = .none
		default:
			self.makHoly.myReaction.likeState = .dislike
		}
		
	}
	
}


