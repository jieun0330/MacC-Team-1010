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
	@Published var fetchLoading = false
	@Published var makHolys: [MakHolyMini] = MakHolyMini.mokDatas
	@Published var comments: [Comment] = Comment.mokDatas
	
	let makgeolliRepository: DefaultMakgeolliRepository
	
	init(
		makgeolliRepository: DefaultMakgeolliRepository
	) {
		self.makgeolliRepository = makgeolliRepository
	}
	
	@MainActor
	func fetchCategoryMakgeolli(categories: [CharacteristicsType]) {
		fetchLoading = true
		Task {
			do {
				// 서버 통신 data
				//				let stringCategory = categories.map { $0.rawValue }
				//				let response = try await makgeolliRepository.fetchMakgeolliList(
				//					categories: stringCategory.isEmpty ? nil : stringCategory
				//				)
				//				makgeollis = (response.result?.contents)!
				
				// mock data
				var categories = categories
				if let index = categories.firstIndex(where: {$0 == .additive}) {
					categories.remove(at: index)
					// 아스파탐이 없는 true
				} else {
					// 아스파탐이 없는 false
				}
				let stringCategory = categories.map { $0.scoreDescription }
				if stringCategory.isEmpty {
					makHolys = MakHolyMini.mokDatas
				} else {
					makHolys = MakHolyMini.mokDatas
					let filteredMakHolys = makHolys.filter { makHoly in
						return stringCategory.allSatisfy { category in
							if category == "sweetness" {
								return makHoly.sweetness >= 3
							} else if category == "sourness" {
								return makHoly.sourness >= 3
							} else if category == "thickness" {
								return makHoly.thickness >= 3
							} else if category == "freshness" {
								return makHoly.freshness >= 3
							}
							return false
						}
					}
					makHolys = filteredMakHolys
				}
				fetchLoading = false
			} catch {
				// error
			}
		}
	}
	
	// 페이지네이션, sort 우선 뒤로
	@MainActor
	func fetchSortMakgeolli() {
		//				let response = try await makgeolliRepository.fetchMakgeolliInfo(
		//					lastMakNum: 5,
		//					categories: ["sweet", "sour"]
		//				)
	}
}
