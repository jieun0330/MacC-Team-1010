//
//  MPInfoActionCount.swift
//  Core
//
//  Created by Eric Lee on 11/26/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation
import Mixpanel

public struct MPInfoActionCount {
	// Comment 관련  인터렉션
	public var addCommentCount: Int = 0
	public var deleteCommentCount: Int = 0
	public var editCommentCount: Int = 0
	public var editCommentVisible: Int = 0
	public var editCommentInvisible: Int = 0
	public var commentDetailCount: Int = 0
	
	// Bookmark 관련 인터렉션
	public var addBookmarkCount: Int = 0
	public var deleteBookmarkCount: Int = 0
	
	// LikeState 관련 인터렉션
	public var addLikeCount: Int = 0
	public var deleteLikeCount: Int = 0
	public var addDisLikeCount: Int = 0
	public var deleteDisLikeCount: Int = 0
	
	// Link 조회 관련 인터렉션
	public var goSalesCount: Int = 0
	public var goBreweryCount: Int = 0
	
	public var mpProperties: [String: MixpanelType] {
		return [
			"add_comment_count": addCommentCount,
			"delete_comment_count": deleteCommentCount,
			"edit_comment_count": editCommentCount,
			"edit_comment_visible_count": editCommentVisible,
			"edit_comment_invisible_count": editCommentInvisible,
			"comment_detail_count": commentDetailCount,
			"add_bookmark_count": addBookmarkCount,
			"delete_bookmark_count": deleteBookmarkCount,
			"add_like_count": addLikeCount,
			"delete_like_count": deleteLikeCount,
			"add_dislike_count": addDisLikeCount,
			"delete_dislike_count": deleteDisLikeCount,
			"go_sales_count": goSalesCount,
			"go_brewery_count": goBreweryCount
		]
	}
}
