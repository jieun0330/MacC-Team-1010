//
//  ReviewRepository.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/02.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Utils

public protocol ReviewRepository {
	func fetchReview() async throws -> [ReviewResponse]
}

public final class DefaultReviewRepository: ReviewRepository {
	let db = Firestore.firestore()
	
	public init() { }
	
	/// 메인에서 코멘트 가져오는 부분 + 코멘트가 달렸어요 눌렀을 때 코멘트 리스트 보여줄 때 사용
	/// 메인에서만 4개 -> 코멘트가 달렸어요로 이동하면 무한 스크롤
	public func fetchReview() async throws -> [ReviewResponse] {
		return try await withUnsafeThrowingContinuation { configuration in
			db.collection("Review")
				.order(by: "updateDate", descending: true)
				.limit(to: 4)
				.getDocuments { snapshot, error in
					if error != nil { return }
					guard let snapshot else { return }
					var reviews: [ReviewResponse] = []
					snapshot.documents.forEach { document in
						let data = document.data()
						let updateDate = data["updateDate"] as! String
						let disclosure = data["disclosure"] as! Bool
						let userID = data["userID"] as! String
						let content = data["content"] as! String
						let makgeolliID = data["content"] as! String
						let docID = data["docID"] as! String
						let preference = data["preference"] as! Int
						let makName = data["makName"] as! String
						let review = ReviewResponse(updateDate: updateDate,
													disclosure: disclosure,
													userID: userID,
													content: content,
													makgeolliID: makgeolliID,
													docID: docID,
													preference: preference,
													makName: makName)
						reviews.append(review)
					}
					configuration.resume(returning: reviews)
				}
		}
	}
}
