//
//  MPUserCount.swift
//  Core
//
//  Created by Eric Lee on 11/29/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public enum MPUserCount {
	
	/// 닫은 상세뷰 수
	case closedInformationView
	
	/// 좋았어요 막걸리 수
	case like
	/// 아쉬워요 막걸리 수
	case dislike
	/// 찜 막걸리 수
	case bookmark
	/// 코멘트 막걸리 수
	case comment
	
	public var title: String {
		switch self {
		case .closedInformationView:
			return "closed_InformationView_Count"
		case .like:
			return "like_Count"
		case .dislike:
			return "dislike_Count"
		case .bookmark:
			return "bookmark_Count"
		case .comment:
			return "comment_Count"
		}
	}
	
}
