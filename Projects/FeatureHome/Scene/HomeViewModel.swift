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
	@Published var newItems: [MakgeolliItem] = []
	@Published var reviews: [ReviewResponse] = []
	@Published var fetchLoading = true
	
	let makgeolliRepository: DefaultMakgeolliRepository
	let reviewRepository: DefaultReviewRepository
	let userRepository: DefaultUserRepository
	
	init(
		makgeolliRepository: DefaultMakgeolliRepository,
		reviewRepository: DefaultReviewRepository,
		userRepository: DefaultUserRepository
	) {
		self.makgeolliRepository = makgeolliRepository
		self.reviewRepository = reviewRepository
		self.userRepository = userRepository
	}
	
	@MainActor
	func fetchNewMakgeolli() {
		Task {
			do {
				let response = try await makgeolliRepository.fetchMakgeolliInfo()
				newItems = (response.result?.contents)!
				fetchLoading = false
			} catch {
				// error
			}
		}
	}
	
	@MainActor
	func fetchReview() {
		Task {
			do {
				reviews = try await reviewRepository.fetchReview()
				fetchLoading = false
			} catch {
				// error
			}
		}
	}
}
