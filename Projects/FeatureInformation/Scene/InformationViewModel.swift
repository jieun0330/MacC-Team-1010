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
	let userId: Int = 1578568449
	let maHolyRepo: DefaultMakgeolliRepository
	let userRepo: DefaultUserRepository
	
	init(makHolyId: Int, maHolyRepo: DefaultMakgeolliRepository, userRepo: DefaultUserRepository) {
		self.makHolyId = 1
		self.maHolyRepo = maHolyRepo
		self.userRepo = userRepo
	}
	
	@Published var isFetchCompleted: Bool = false
	@Published var makHoly: MakHoly = MakHoly()
	@Published var likeDetail: LikeDetail = LikeDetail()
	@Published var comments: [VisibleComment] = []
	
	@Published var showActionSheet: Bool = false
	@Published var showCommentSheet: Bool = false
	
	private var user: User = User.user1
	
	@MainActor
	func fetchDatas() {
		Task {
			await withTaskGroup(of: Void.self) { group in
				group.addTask {
					await self.fetchMakHoly()
				}
				group.addTask {
					await self.fetchReactions()
				}
				
				for _ in 0..<2 {
					await group.next()
				}
				
				isFetchCompleted = true
			}
		}
	}
	
	// detail api
	@MainActor
	func fetchMakHoly() {
		Task {
			
			do {
				let makHoly = try await maHolyRepo.fetchDetail(makNumber: self.makHolyId, userId: self.userId)
				self.makHoly = makHoly
				print("fetchMakHoly Completed : ------- \n \(makHoly) \n -------")
				self.isFetchCompleted = true
			} catch {
				Logger.debug(error: error, message: "InformationViewModel -fetchMakHoly()")
			}
			
		}
	}
	
	// makLikesAndComments  api
	@MainActor
	func fetchReactions() {
		Task {
			
			do {
				let result = try await maHolyRepo.fetchMakLikesAndComments(makNumber: 1)
				self.likeDetail = result.0
				self.comments = result.1
				print("fetchReactions Completed : -------")
				print("likeDetail : \(likeDetail)")
				print("comments : \(comments)")
				print("----------------------------------")
			} catch {
				Logger.debug(error: error, message: "InformationViewModel -fetchReactions()")
			}
			
		}
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
	
	@MainActor
	func postLikeState() {
		Task {
			do {
				let response = try await userRepo.evaluateMak(EvaluateMakRequest(
					userId: self.userId,
					makNumber: self.makHolyId,
					likeState: self.makHoly.myReaction.likeState))
				print("postLikeState Completed : -------")
				print("response : \(response)")
				print("----------------------------------")
			} catch {
				Logger.debug(error: error, message: "InformationViewModel -postLikeState()")
			}
		}
	}
	
}


