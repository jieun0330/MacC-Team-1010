//
//  UserRepository.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Utils

public protocol UserRepository {
	func fetchUser(userId: String) async throws -> UserResponse
}

public final class DefaultUserRepository: UserRepository {
	let db = Firestore.firestore()
	
	public init() { }
	
	public func fetchUser(userId: String = "") async throws -> UserResponse {
		return try await withUnsafeThrowingContinuation { configuration in
			db.collection("User").getDocuments { snapshot, error in
				if error != nil { return }
				guard let snapshot else { return }
				if let document = snapshot.documents.first(where: {
					$0.documentID == (userId == "" ?
									  KeyChainManager().read(account: .accessToken) : userId)
				}) {
					let data = document.data()
					let bookmark = data["bookmark"] as! [String]
					let review = data["review"] as! [String]
					let bad = data["bad"] as! [String]
					let like = data["like"] as! [String]
					let userID = data["userID"] as! String
					let user = UserResponse(bookmark: bookmark,
											review: review,
											like: like,
											bad: bad,
											userID: userID)
					configuration.resume(returning: user)
				}
			}
		}
	}
}
