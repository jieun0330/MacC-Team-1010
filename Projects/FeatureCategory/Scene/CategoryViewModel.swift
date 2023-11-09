//
//  CategoryListViewModel.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/21.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import Core

final class CategoryViewModel: ObservableObject {
	@Published var fetchLoading = true
	@Published var fetchCommentLoading = true
	@Published var makHolys: [MakContent] = []
	@Published var comments: [RecentComment] = []
	
	var currentOffset: Int = 0
	var isLastPage = false
	
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
	func initFetchCategoryMakgeolli(sort: String?,
									offset: Int?,
									categories: [CharacteristicsType]?) {
		fetchLoading = true
		Task {
			do {
				makHolys = []
				var stringCategory: [String] = []
				if let categories {
					if !categories.isEmpty {
						stringCategory = categories.map { $0.rawValue }
					}
				}
				
				let response = try await self.makgeolliRepository.fetchFindByFeatures(
					sort: sort, offset: 0, category: stringCategory
				)
				
				self.currentOffset = 0
				self.isLastPage = response.result?.makInfo?.last ?? true
				
				makHolys.append(contentsOf: response.result?.makInfo?.content ?? [])
				
				fetchLoading = false
			} catch {
				Logger.debug(error: error, message: "")
			}
		}
	}
	
	@MainActor
	func nextFetchCategoryMakgeolli(sort: String?,
									offset: Int?,
									categories: [CharacteristicsType]?) {
		fetchLoading = true
		Task {
			do {
				var stringCategory: [String] = []
				if let categories {
					if !categories.isEmpty {
						stringCategory = categories.map { $0.rawValue }
					}
				}
				
				let response = try await self.makgeolliRepository.fetchFindByFeatures(
					sort: sort, offset: offset, category: stringCategory
				)
				
				self.currentOffset = offset ?? 0
				self.isLastPage = response.result?.makInfo?.last ?? true
				
				makHolys.append(contentsOf: response.result?.makInfo?.content ?? [])
				
				fetchLoading = false
			} catch {
				Logger.debug(error: error, message: "")
			}
		}
	}
	
	@MainActor
	func fetchRecentComments() {
		fetchCommentLoading = true
		Task {
			do {
				let response = try await homeRepository.fetchRecentComment()
				comments = response.result ?? []
				fetchCommentLoading = false
			} catch {
				Logger.debug(error: error, message: "")
			}
		}
	}
}
