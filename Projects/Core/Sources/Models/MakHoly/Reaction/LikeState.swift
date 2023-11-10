//
//  LikeState.swift
//  Core
//
//  Created by Eric Lee on 11/6/23.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

public enum LikeState {
	case none
	case like
	case dislike
	
	init(_ isLiked: Bool?) {
		if let isLiked = isLiked {
			self = isLiked ? .like : .dislike
		} else {
			self = .none
		}
	}
	
}
