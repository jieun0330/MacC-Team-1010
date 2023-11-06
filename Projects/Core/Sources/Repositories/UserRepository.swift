//
//  UserRepository.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/06.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import Utils

public protocol UserRepository {
	func skipSignin(userNickName: String,
					userSex: String,
					userAgeRange: String) async throws -> UserResponse
}

public final class DefaultUserRepository: UserRepository {
	public init() { }
	
	public func skipSignin(userNickName: String,
						   userSex: String,
						   userAgeRange: String) async throws -> UserResponse {
		let response = try await UserAPI.request(target: UserAPI.skipSignin(
			parameter: UserRequest(userNickName: userNickName,
								   userSex: userSex,
								   userAgeRange: userAgeRange)), dataType: UserResponse.self
		)
		return response
	}
}
