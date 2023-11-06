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
	func skipSignin(_ request: UserRequest) async throws -> UserResponse
	func updateComment(_ request: UpdateCommentRequest) async throws -> CommentResponse
}

public final class DefaultUserRepository: UserRepository {
	public init() { }
	
	public func skipSignin(_ request: UserRequest) async throws -> UserResponse {
		let response = try await UserAPI.request(target: UserAPI.skipSignin(
			parameter: request), dataType: UserResponse.self
		)
		return response
	}
	
	public func updateComment(_ request: UpdateCommentRequest) async throws -> CommentResponse {
		let response = try await UserAPI.request(target: UserAPI.updateComment(
			parameter: request), dataType: CommentResponse.self
		)
		return response
	}
	
	public func insertComment(_ request: InsertCommentRequest) async throws -> CommentResponse {
		let response = try await UserAPI.request(target: UserAPI.insertComment(
			parameter: request), dataType: CommentResponse.self
		)
		return response
	}
	
	public func deleteComment(_ request: DeleteCommentRequest) async throws -> CommentResponse {
		let response = try await UserAPI.request(target: UserAPI.deleteComment(
			parameter: request), dataType: CommentResponse.self
		)
		return response
	}
}
