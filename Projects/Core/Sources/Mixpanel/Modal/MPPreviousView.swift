//
//  MPPreviousView.swift
//  Core
//
//  Created by Eric Lee on 11/26/23.
//  Copyright © 2023 com.teamten. All rights reserved.
//

import Foundation

public enum MPPreviousView: MPPropertiable {
	case homeNewItemCell
	case homeNewCommentCell
	case eventView
	case hastagView
	case newItemView
	case newCommentView
	case searchView
	case imageSearchView
	case myView
	
	var mpProperty: String {
		return "previous_view"
	}
	
	var mpMixpanelType: String {
		switch self {
		case .homeNewItemCell:
			return "Home_NewItemCell"
		case .homeNewCommentCell:
			return "HomeView_NewComment"
		case .eventView:
			return "EventView"
		case .hastagView:
			return "HastagView"
		case .newItemView:
			return "NewItemView"
		case .newCommentView:
			return "NewCommentView"
		case .searchView:
			return "SearchView"
		case .imageSearchView:
			return "ImageSearchView"
		case .myView:
			return "MyView"
		}
	}
}

