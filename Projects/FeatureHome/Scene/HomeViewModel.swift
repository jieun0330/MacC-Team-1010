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
	@Published var fetchLoading = true
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
				fetchLoading = false
			} catch {
				Logger.debug(error: error, message: "")
			}
		}
	}
	
	@MainActor
	func fetchRecentComments() {
		Task {
			do {
				let response = try await homeRepository.fetchRecentComment()
				comments = response.result ?? []
				fetchLoading = false
			} catch {
				Logger.debug(error: error, message: "")
			}
		}
	}
}
