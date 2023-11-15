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
	
	var fetchLoading = false
	let userRepository: DefaultUserRepository
	
	init(userRepository: DefaultUserRepository) {
		self.userRepository = userRepository
	}
	
	@MainActor
	func getUserMakFolder(segmentName: String = "entire") {
		fetchLoading = true
		Task {
			do {
				let response = try await self.userRepository.getUserMakFolder(
					GetUserMakFolderRequest(userId: 1546076304, segmentName: segmentName)
				)
				if let content = response.result?.makUserTable?.content {
					makModel = content
				} else {
					makModel = []
				}
				if response.status == 200 {
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
					UpdateCommentRequest(userId: 1546076304,
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
					DeleteCommentRequest(userId: 1546076304,
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
