//
//  OnboardingViewModel.swift
//  FeatureOnboarding
//
//  Created by Kim SungHun on 2023/11/08.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import Core
import Utils

final class OnboardingViewModel: ObservableObject {
	@Published var fetchLoading = false
	@Published var navigationState = false
	
	let userRepository: DefaultUserRepository
	
	init(
		userRepository: DefaultUserRepository
	) {
		self.userRepository = userRepository
	}
	
	@MainActor
	func skipSignin(nickname: String, sex: String, ageRange: String) {
		fetchLoading = true
		Task {
			do {
				let response = try await userRepository.skipSignin(UserRequest(userNickName: nickname,
																			   userSex: sex,
																			   userAgeRange: ageRange))
				do {
					if let response = response.result, let userID = response.userID {
						UserDefaultsSetting.nickname = nickname
						try KeyChainManager.shared.create(account: .userId, data: "\(userID)")
					}
				} catch {
					Logger.debug(error: error, message: "")
				}
				fetchLoading = false
				navigationState = true
			} catch {
				Logger.debug(error: error, message: "")
			}
		}
	}
}
