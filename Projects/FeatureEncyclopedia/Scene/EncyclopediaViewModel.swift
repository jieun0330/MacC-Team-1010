//
//  EncyclopediaViewModel.swift
//  FeatureEncyclopedia
//
//  Created by 박지은 on 2023/11/10.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import Core
import Utils

final class EncyclopediaViewModel: ObservableObject {
	@Published var makModel: [GetUserMakFolderContent] = []
	@Published var errorState = false
	@Published var resultMakHolyId: Int? = nil
	
	var fetchLoading = true
	let userRepository: DefaultUserRepository
	
	var currentOffset: Int = 0
	var isLastPage = false
	
	init(userRepository: DefaultUserRepository) {
		self.userRepository = userRepository
	}
	
	@MainActor
	func getUserMakFolder(segmentName: String = "entire", offset: Int = 0) {
		fetchLoading = true
		Task {
			do {
				makModel = []
				let response = try await self.userRepository.getUserMakFolder(
					GetUserMakFolderRequest(userId: Int(KeyChainManager().read(account: .userId))!,
											segmentName: segmentName,
											offset: offset)
				)
				if response.status == 200 {
					makModel = response.result?.makUserTable?.content ?? []
					isLastPage = response.result?.makUserTable?.last ?? true
					fetchLoading = false
				} else {
					errorState = true
					makModel = []
				}
			} catch {
				Logger.debug(error: error, message: "")
				errorState = true
				makModel = []
			}
		}
	}
	
	@MainActor
	func nextGetUserMakFolder(segmentName: String = "entire", offset: Int) {
		fetchLoading = true
		Task {
			do {
				let response = try await self.userRepository.getUserMakFolder(
					GetUserMakFolderRequest(userId: Int(KeyChainManager().read(account: .userId))!,
											segmentName: segmentName,
											offset: offset)
				)
				self.currentOffset = offset
				if response.status == 200 {
					isLastPage = response.result?.makUserTable?.last ?? true
					makModel.append(contentsOf: response.result?.makUserTable?.content ?? [])
					fetchLoading = false
				} else {
					errorState = true
					makModel = []
				}
			} catch {
				Logger.debug(error: error, message: "")
				errorState = true
				makModel = []
			}
		}
	}
	
	@MainActor
	func updateComment(makSeq: Int, contents: String, isVisible: String) {
		Task {
			do {
				let response = try await self.userRepository.updateComment(
					UpdateCommentRequest(userId: Int(KeyChainManager().read(account: .userId))!,
										 makNumber: makSeq,
										 contents: contents,
										 isVisible: isVisible)
				)
				if response.status == 200 {
					self.getUserMakFolder()
				} else {
					errorState = true
				}
			} catch {
				Logger.debug(error: error, message: "")
				errorState = true
			}
		}
	}
	
	@MainActor
	func deleteComment(makSeq: Int) {
		Task {
			do {
				let response = try await self.userRepository.deleteComment(
					DeleteCommentRequest(userId: Int(KeyChainManager().read(account: .userId))!,
										 makNumber: makSeq)
				)
				if response.status == 200 {
					self.getUserMakFolder()
				} else {
					errorState = true
				}
			} catch {
				Logger.debug(error: error, message: "")
				errorState = true
			}
		}
	}
}
