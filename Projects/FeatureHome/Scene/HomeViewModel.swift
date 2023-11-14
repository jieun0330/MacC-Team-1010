//
//  HomeViewModel.swift
//  FeatureHome
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import Core
import Combine

final class HomeViewModel: ObservableObject {
	@Published var fetchLoading = true
	@Published var makListLoading = true
	@Published var commentsLoading = true
	
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
		initLoading()
	}
	
	func initLoading() {
		Publishers.CombineLatest($makListLoading, $commentsLoading)
			.map { makListLoading, commentsLoading in
				return !makListLoading && !commentsLoading ? false : true
			}
			.receive(on: DispatchQueue.main)
			.assign(to: &$fetchLoading)
	}
	
	@MainActor
	func fetchNewMakList() {
		Task {
			do {
				//				let response = try await homeRepository.fetchNewMakList()
				//				newItems = response.result ?? []
				//				fetchLoading = false
				makListLoading = false
			} catch {
				Logger.debug(error: error, message: "")
			}
		}
	}
	
	@MainActor
	func fetchRecentComments() {
		Task {
			do {
				//				let response = try await homeRepository.fetchRecentComment()
				//				comments = response.result ?? []
				//				fetchLoading = false
				commentsLoading = false
			} catch {
				Logger.debug(error: error, message: "")
			}
		}
	}
}
