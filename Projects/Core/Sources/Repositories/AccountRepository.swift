//
//  AccountRepository.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation
import Utils

public protocol AccountRepository {
	func modifyUserNickname(_ request: ModifyNicknameRequest) async throws -> ModifyNicknameResponse
	func deleteUserAccount(_ request: DeleteUserRequest) async throws -> DeleteUserResponse
	func dataLinking(_ request: DataLinkingRequest) async throws -> DataLinkingResponse
	func findMatchAccount(_ request: FindMatchAccountRequest) async throws -> FindMatchAccountResponse
}

public final class DefaultAccountRepository: AccountRepository {
	public init() { }
	
	public func modifyUserNickname(_ request: ModifyNicknameRequest) async throws -> ModifyNicknameResponse {
		let response = try await AccountAPI.request(target: AccountAPI.modifyUserNickname(
			parameter: request), dataType: ModifyNicknameResponse.self
		)
		return response
	}
	
	public func deleteUserAccount(_ request: DeleteUserRequest) async throws -> DeleteUserResponse {
		let response = try await AccountAPI.request(target: AccountAPI.deleteUserAccount(
			parameter: request), dataType: DeleteUserResponse.self
		)
		return response
	}
	
	public func dataLinking(_ request: DataLinkingRequest) async throws -> DataLinkingResponse {
		let response = try await AccountAPI.request(target: AccountAPI.dataLinking(
			parameter: request), dataType: DataLinkingResponse.self
		)
		return response
	}
	
	public func findMatchAccount(_ request: FindMatchAccountRequest) async throws -> FindMatchAccountResponse {
		let response = try await AccountAPI.request(target: AccountAPI.findMatchAccount(
			parameter: request), dataType: FindMatchAccountResponse.self
		)
		return response
	}
}
