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
	@Published var makgeollis: [MakgeolliItem] = []
	
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
				let stringCategory = categories.map { $0.rawValue }
				let response = try await makgeolliRepository.fetchMakgeolliList(
					categories: stringCategory.isEmpty ? nil : stringCategory
				)
				makgeollis = (response.result?.contents)!
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
