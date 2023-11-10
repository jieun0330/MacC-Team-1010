//
//  GetUserMakFolderResponse.swift
//  Core
//
//  Created by Kim SungHun on 2023/11/07.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public struct GetUserMakFolderResponse: Codable {
    public let status: Int
    public let resultMsg: String
    public let result: GetUserMakFolderResult?
}

public struct GetUserMakFolderResult: Codable {
    public let userId: Int?
    public let makUserTable: MakUserTable?
}

public struct MakUserTable: Codable {
    public let content: [GetUserMakFolderContent]?
    public let pageable: Pageable?
    public let totalPages, totalElements: Int?
    public let last: Bool?
    public let size, number: Int?
    public let sort: Sort?
    public let numberOfElements: Int?
    public let first, empty: Bool?
}

public struct GetUserMakFolderContent: Hashable, Codable {
    public let makSeq: Int?
    public let makNm, makImg: String?
    public let reactionLike, reactionWish: String?
    public let reactionComment: String?
    public let reactionLikeDate: String?
    public let reactionWishDate: String?
    public let reactionCommentDate: String?
}

public struct Pageable: Codable {
    public let pageNumber, pageSize: Int?
    public let sort: Sort?
    public let offset: Int?
    public let paged, unpaged: Bool?
}

public struct Sort: Codable {
    public let empty, sorted, unsorted: Bool?
}
