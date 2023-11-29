//
//  OnboardingViewModel.swift
//  FeatureOnboarding
//
//  Created by Kim SungHun on 2023/11/08.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import SwiftUI
import Core
import Utils

public final class OnboardingViewModel: ObservableObject {
	@Published var fetchLoading = false
	@Published var navigationHome = false
	@Published var navigationLoadData = false
	@Published var navigationBirth = false
	@Published var navigationGender = false
	@Published var showNickDupli: NicknameState = .normal
	@Published var timerStatus: PhoneNumberTimerStatus = .normal
	@Published var alertItem: AlertItem?
	
	var findMatchUserData: FindMatchAccountUserResult?
	
	let userRepository: DefaultUserRepository
	let authRepository: DefaultAuthRepository
	let accountRepository: DefaultAccountRepository
	
	public init(
		userRepository: DefaultUserRepository,
		authRepository: DefaultAuthRepository,
		accountRepository: DefaultAccountRepository
	) {
		self.userRepository = userRepository
		self.authRepository = authRepository
		self.accountRepository = accountRepository
	}
	
	@MainActor
	func phoneSignin(nickname: String, sex: String, phoneNumber: String, birth: String) async throws {
		fetchLoading = true
		Task {
			do {
				let response = try await userRepository.phoneSignin(AuthUserRequest(userNickName: nickname,
																					userPhone: phoneNumber,
																					userSex: sex,
																					userBirth: birth))
				do {
					if let response = response.result, let userID = response.userID {
						try KeyChainManager.shared.create(account: .userId,
														  data: "\(userID)")
						try KeyChainManager.shared.create(account: .profileImage,
														  data: "\("profileIcon1")")
						try KeyChainManager.shared.create(account: .nickname,
														  data: "\(nickname)")
						try KeyChainManager.shared.create(account: .phoneBackNum,
														  data: "\(response.userPhone ?? "")")
						fetchLoading = false
					}
				} catch {
					handleNetworkError(error)
				}
			} catch {
				handleNetworkError(error)
			}
		}
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
						try KeyChainManager.shared.create(account: .userId,
														  data: "\(userID)")
						try KeyChainManager.shared.create(account: .profileImage,
														  data: "\("profileIcon1")")
						try KeyChainManager.shared.create(account: .nickname,
														  data: "\(nickname)")
						try KeyChainManager.shared.create(account: .phoneBackNum,
														  data: "")
						
						MixpanelManager.shared.setUserProfile(userId: "\(userID)", name: nickname, sex: sex, yearOfBirth: ageRange, signupMethod: .ShortCut)
						MixpanelManager.shared.signupEvent(method: .ShortCut)
						
						fetchLoading = false
						navigationHome = true
					}
				} catch {
					handleNetworkError(error)
				}
			} catch {
				handleNetworkError(error)
			}
		}
	}
	
	@MainActor
	func checkNickname(nickname: String) {
		fetchLoading = true
		Task {
			do {
				let response = try await userRepository.checkNickname(nickname)
				if let isSuccess = response.result?.isSuccess {
					if isSuccess {
						self.showNickDupli = .notduplicate
					} else {
						self.showNickDupli = .duplicate
					}
					fetchLoading = false
				}
			} catch {
				handleNetworkError(error)
			}
		}
	}
	
	@MainActor
	func sendSMS(phoneNumber: String) {
		fetchLoading = true
		Task {
			do {
				let response = try await authRepository.smsSend(SmsSendRequest(phone: phoneNumber))
				if response.status == 200 {
					fetchLoading = false
				}
			} catch {
				handleNetworkError(error)
			}
		}
	}
	
	@MainActor
	func confirmSMS(phoneNumber: String, certificationNumber: String) {
		fetchLoading = true
		Task {
			do {
				let response = try await authRepository.smsConfirm(
					SmsConfirmRequest(phone: phoneNumber,
									  certificationNumber: certificationNumber)
				)
				if response.status == 200 {
					navigationBirth = true
				} else {
					timerStatus = .retry
				}
				fetchLoading = false
			} catch {
				handleNetworkError(error)
			}
		}
	}
	
	@MainActor
	func findMatchAccount(phoneNumber: String, birth: String) {
		fetchLoading = true
		Task {
			do {
				let response = try await accountRepository.findMatchAccount(
					FindMatchAccountRequest(phone: phoneNumber, birth: birth)
				)
				if response.status == 200 {
					if response.result!.isAccountExisted! {
						findMatchUserData = response.result?.userResults
						navigationLoadData = true
					} else {
						navigationGender = true
					}
					fetchLoading = false
				}
			} catch {
				handleNetworkError(error)
			}
		}
	}
}

private extension OnboardingViewModel {
	func handleNetworkError(_ error: Error) {
		Logger.debug(error: error, message: "")
		alertItem = AlertItem(title: Text("네트워크 에러"),
							  message: Text("인터넷 연결상태를 확인해주세요."),
							  dismissButton: .default(Text("확인")))
	}
}
