//
//  CategoryListViewModel.swift
//  FeatureCategoryList
//
//  Created by Kim SungHun on 2023/10/21.
//  Copyright © 2023 com.tenten. All rights reserved.
//

import Foundation

final class CategoryListViewModel: ObservableObject {
	
	@Published var fetchLoading = true
	
	func fetchCategoryList() {
		fetchLoading = true
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
			self?.fetchLoading = false
		}
	}
}
