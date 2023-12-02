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
	@Published var errorState = false
	@Published var makHolys: [MakContent] = []
	@Published var comments: [RecentComment] = []
	@Published var resultMakHolyId: Int? = nil
	
	var sortText = "추천순"
	var currentOffset: Int = 0
	var isLastPage = false
	
	let makgeolliRepository: DefaultMakgeolliRepository
	let homeRepository: DefaultHomeRepository
	let topicRepository: DefaultTopicRepository
	
	init(
		makgeolliRepository: DefaultMakgeolliRepository,
		homeRepository: DefaultHomeRepository,
		topicRepository: DefaultTopicRepository
	) {
		self.makgeolliRepository = makgeolliRepository
		self.homeRepository = homeRepository
		self.topicRepository = topicRepository
	}
	
	@MainActor
	func initNewCategoryMakgeolli() {
		fetchLoading = true
		Task {
			do {
				makHolys = []
				
				let response = try await self.homeRepository.fetchNewMakList()
				if response.status == 200 {
					makHolys = response.result!.map { makData in
						return mapMakDataToMakContent(makData)
					}
					fetchLoading = false
				} else {
					errorState = true
				}
			} catch {
				Logger.debug(error: error, message: "")
				errorState = true
			}
		}
		
		func mapMakDataToMakContent(_ makData: NewMakListMakgeolliDetail) -> MakContent {
			return MakContent(
				makSeq: makData.makNumber ?? 0,
				makName: makData.makName ?? "",
				makType: makData.makType ?? "",
				makAlcoholPercentage: makData.mainDetail?.makAlcoholPercentage ?? 0.0,
				makVolume: makData.mainDetail?.makVolume ?? 0,
				makPrice: Int(makData.mainDetail?.makPrice ?? 0),
				makTasteSweet: makData.taste.makTasteSweet ?? -1.0,
				makTasteSour: makData.taste.makTasteSour ?? -1.0,
				makTasteThick: makData.taste.makTasteThick ?? -1.0,
				makTasteFresh: makData.taste.makTasteFresh ?? -1.0,
				makImageNumber: makData.makImageNumber ?? ""
			)
		}
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
				
				if response.status == 200 {
					fetchLoading = false
					makHolys.append(contentsOf: response.result?.makInfo?.content ?? [])
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
				
				if response.status == 200 {
					fetchLoading = false
					makHolys.append(contentsOf: response.result?.makInfo?.content ?? [])
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
		fetchCommentLoading = true
		Task {
			do {
				let response = try await homeRepository.fetchRecentComment()
				if response.status == 200 {
					fetchCommentLoading = false
					comments = response.result ?? []
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
	func initFetchPohangMakgeolli() {
		fetchLoading = true
		Task {
			do {
				let response = try await topicRepository.fetchPohangMakgeolli()

				if response.status == 200 {
					fetchLoading = false
					makHolys.append(contentsOf: response.result?.content ?? [])
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
	func initFetch2023KoreaAward() {
		fetchLoading = true
		Task {
			do {
				let response = try await topicRepository.fetchKoreaAward2023(size: 16)

				if response.status == 200 {
					fetchLoading = false
					makHolys.append(contentsOf: response.result?.content ?? [])
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
