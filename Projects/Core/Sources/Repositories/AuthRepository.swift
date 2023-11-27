//
//  AuthRepository.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/27.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation
import Utils

public protocol AuthRepository {
	func smsSend(_ request: SmsSendRequest) async throws -> SmsSendResponse
	func smsConfirm(_ request: SmsConfirmRequest) async throws -> SmsConfirmResponse
}

public final class DefaultAuthRepository: AuthRepository {
	public init() { }
	
	public func smsSend(_ request: SmsSendRequest) async throws -> SmsSendResponse {
		let response = try await AuthAPI.request(target: AuthAPI.smsSend(
			parameter: request), dataType: SmsSendResponse.self
		)
		return response
	}
	
	public func smsConfirm(_ request: SmsConfirmRequest) async throws -> SmsConfirmResponse {
		let response = try await AuthAPI.request(target: AuthAPI.smsConfirm(
			parameter: request), dataType: SmsConfirmResponse.self
		)
		return response
	}
}
