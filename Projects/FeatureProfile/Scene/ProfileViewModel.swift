//
//  ProfileViewModel.swift
//  FeatureProfile
//
//  Created by Kim SungHun on 2023/11/28.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation
import SwiftUI
import Core
import Utils

public final class ProfileViewModel: ObservableObject {
	@Published var showNickDupli: NicknameState = .normal
	@Published var alertItem: AlertItem?
	@Published var timerStatus: PhoneNumberTimerStatus = .normal
	@Published var navigationBirth = false
	@Published var navigationLoadData = false
	@Published var savedAlert = false
	@Published var fetchLoading = false
	
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
	func checkNickname(nickname: String) async throws {
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
	func modifyUserNickname(nickname: String, selectedProfileIcon: String) async throws {
		fetchLoading = true
		Task {
			do {
				let response = try await accountRepository.modifyUserNickname(
					ModifyNicknameRequest(
						userId: KeyChainManager.shared.read(account: .userId),
						modifyNickname: nickname))
				if let isSuccess = response.result?.isSuccess {
					if isSuccess {
						try KeyChainManager.shared.create(account: .nickname,
														  data: nickname)
						try KeyChainManager.shared.create(account: .profileImage,
														  data: selectedProfileIcon)
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
						dataLinking(phoneNumber: phoneNumber, birth: birth)
					}
					fetchLoading = false
				}
			} catch {
				handleNetworkError(error)
			}
		}
	}
	
	@MainActor
	func dataLinking(phoneNumber: String, birth: String) {
		fetchLoading = true
		Task {
			do {
				let response = try await accountRepository.dataLinking(
					DataLinkingRequest(userId: KeyChainManager.shared.read(account: .userId),
									   phone: phoneNumber, birth: birth)
				)
				if response.status == 200 {
					try KeyChainManager.shared.create(account: .phoneBackNum,
													  data: (response.result?.phoneSuffix)!)
					savedAlert = true
					fetchLoading = false
				}
			} catch {
				handleNetworkError(error)
			}
		}
	}
	
	@MainActor
	func deleteUserAccount() {
		Task {
			do {
				let response = try await accountRepository.deleteUserAccount(
					DeleteUserRequest(userId: KeyChainManager.shared.read(account: .userId))
				)
				if response.status == 200 {
					try KeyChainManager.shared.delete(account: .nickname)
					try KeyChainManager.shared.delete(account: .phoneBackNum)
					try KeyChainManager.shared.delete(account: .profileImage)
					try KeyChainManager.shared.delete(account: .userId)
					
					UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
					DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
						exit(0)
					}
				}
			} catch {
				handleNetworkError(error)
			}
		}
	}
}

private extension ProfileViewModel {
	func handleNetworkError(_ error: Error) {
		Logger.debug(error: error, message: "")
		alertItem = AlertItem(title: Text("네트워크 에러"),
							  message: Text("인터넷 연결상태를 확인해주세요."),
							  dismissButton: .default(Text("확인")))
	}
}
