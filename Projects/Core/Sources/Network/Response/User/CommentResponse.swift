//
//  CommentResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/06.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct CommentResponse: Codable {
	public let status: Int
	public let resultMsg: String?
	public let result: CommentResult?
}

public struct CommentResult: Codable {
	public let isSuccess: Bool?
	public let message: String?
}
