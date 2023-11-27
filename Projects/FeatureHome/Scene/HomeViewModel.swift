//
//  HomeViewModel.swift
//  FeatureHome
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import Core

final class HomeViewModel: ObservableObject {
	@Published var makListLoading = true
	@Published var commentsLoading = true
	@Published var errorState = false
	@Published var resultMakHolyId: Int? = nil
	@Published var resultLatestestCommentMakHolyId: Int? = nil
	
	@Published var newItems: [NewMakListMakgeolliDetail] = []
	@Published var comments: [RecentComment] = []
	
	let makgeolliRepository: DefaultMakgeolliRepository
	let homeRepository: DefaultHomeRepository
	
	init(
		makgeolliRepository: DefaultMakgeolliRepository,
		homeRepository: DefaultHomeRepository
	) {
		self.makgeolliRepository = makgeolliRepository
		self.homeRepository = homeRepository
	}
	
	@MainActor
	func fetchNewMakList() {
		Task {
			do {
				let response = try await homeRepository.fetchNewMakList()
				newItems = response.result ?? []
				if response.status == 200 {
					makListLoading = false
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
	func fetchRecentComments() {
		Task {
			do {
				let response = try await homeRepository.fetchRecentComment()
				comments = response.result ?? []
				if response.status == 200 {
					commentsLoading = false
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
