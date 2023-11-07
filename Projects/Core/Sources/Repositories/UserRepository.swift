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
	func evaluateMak(_ request: EvaluateRequest) async throws -> EvaluateResponse
	func addWishList(_ request: WishListRequest) async throws -> WishListResponse
	func deleteWishList(_ request: WishListRequest) async throws -> WishListResponse
	func getUserMakFolder(_ request: GetUserMakFolderRequest) async throws -> GetUserMakFolderResponse
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

	public func evaluateMak(_ request: EvaluateRequest) async throws -> EvaluateResponse {
		let response = try await UserAPI.request(target: UserAPI.evaluateMak(
			parameter: request), dataType: EvaluateResponse.self
		)
		return response
	}
	
	public func addWishList(_ request: WishListRequest) async throws -> WishListResponse {
		let response = try await UserAPI.request(target: UserAPI.addWishList(
			parameter: request), dataType: WishListResponse.self
		)
		return response
	}
	
	public func deleteWishList(_ request: WishListRequest) async throws -> WishListResponse {
		let response = try await UserAPI.request(target: UserAPI.deleteWishList(
			parameter: request), dataType: WishListResponse.self
		)
		return response
	}
	
	public func getUserMakFolder(_ request: GetUserMakFolderRequest) async throws -> GetUserMakFolderResponse {
		let request: [String: Any] = try request.asDictionary()
		let response = try await UserAPI.request(target: UserAPI.getUserMakFolder(
			parameter: request), dataType: GetUserMakFolderResponse.self
		)
		return response
	}
}
